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

  def update_bill params
    update_params = {}
    update_params[:amount] = params[:amount] if params[:amount]
    update_params[:name] = params[:name] if params[:name]
    update_params[:next_due_date] = params[:next_due_date] if params[:next_due_date]
    update_params[:category] = Category.find_by(id: params[:category]) if params[:category]
    update_params[:repeat_interval] = RepeatInterval.find_by(id: params[:repeat_interval]) if params[:repeat_interval]

    params[:tags].map do |tag|
      tags.find_or_initialize_by(name: tag)
    end

    update(update_params)
  end
end
