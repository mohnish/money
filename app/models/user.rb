class User < ActiveRecord::Base
  has_many :bills
  has_many :payment_sources

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :password, {
    presence: true,
    on: :create
  }

  validates :email_address, {
    uniqueness: true,
    presence: true,
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    }
  }

  validates :username, {
    uniqueness: true,
    presence: true,
    length: { maximum: 12, minimum: 2 }
  }

  def username=(value)
    self[:username] = value.downcase
  end

  def create_bill params
    repeat_interval = RepeatInterval.find_by(id:  params[:repeat_interval])

    bills.create do |bill|
      bill.amount = params[:amount]
      bill.name = params[:name]
      bill.next_due_date = params[:next_due_date]
      bill.repeat_interval = repeat_interval
      bill.category = Category.find_by(id: params[:category])
      bill.payments.new(payment_source_id: params[:payment_source_id], amount: params[:amount]) if repeat_interval.try(:one_time?)
      params[:tags].map do |tag|
        bill.tags.find_or_initialize_by(name: tag)
      end
    end
  end
end
