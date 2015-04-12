class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :repeat_interval
  has_many :tags, as: :entity
  has_many :payments

  validates_presence_of :repeat_interval
  validates_presence_of :next_due_date
  validates_presence_of :category
  validates_presence_of :user
  validates :amount, {
      presence: {
        message: 'please enter a valid amount'
      },
      numericality: {
        message: 'please enter a valid amount'
      }
  }

  enum status: { active: 0, inactive: 1 }

  def update_next_due_date
    return if repeat_interval.one_time?
    update(next_due_date: repeat_interval.calculate_next_due_date(next_due_date))
  end

  def update_tags tag_names
    return if tag_names.blank?
    tag_names.each { |tag| tags.where(name: tag).first_or_create }
  end
end
