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
    update(next_due_date: repeat_interval.calculate_next_due_date(Time.zone.now))
  end

  # input format: '03/23/2015'
  def next_due_date=(value)
    if value.is_a?(ActiveSupport::TimeWithZone)
      self[:next_due_date] = value
    else
      split_value = value.to_s.split('/')
      return unless (3 == split_value.size)
      month, day, year = split_value.map(&:to_i)
      self[:next_due_date] = Time.zone.parse("#{day}/#{month}/#{year}") if Date.valid_date?(year, month, day)
    end
  end
end
