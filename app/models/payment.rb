class Payment < ActiveRecord::Base
  belongs_to :bill
  belongs_to :payment_source
  has_many :notes, as: :entity

  validates_numericality_of :amount, greater_than: 0.0
  validates_presence_of :amount
  validates_presence_of :bill
  validates_presence_of :payment_source

  after_create :update_bill_attributes

  def update_bill_attributes
    if bill.repeat_interval.one_time?
      bill.inactive!
    else
      bill.update_next_due_date
    end
  end
end
