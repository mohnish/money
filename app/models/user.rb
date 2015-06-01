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

  def email_address=(value)
    self[:email_address] = value.downcase
  end
end
