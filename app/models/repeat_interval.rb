class RepeatInterval < ActiveRecord::Base
  validates_presence_of :interval

  def one_time?
    'one_time' == interval
  end

  def daily?
    '1_day' == interval
  end

  def weekly?
    '1_week' == interval
  end

  def bimonthly?
    '2_week' == interval
  end

  def monthly?
    '1_month' == interval
  end

  def yearly?
    '1_year' == interval
  end

  def calculate_next_due_date current_due_date
    return unless current_due_date.is_a?(ActiveSupport::TimeWithZone)
    current_due_date + years.years + months.months + weeks.weeks + days.days
  end
end
