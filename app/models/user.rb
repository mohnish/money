class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email_address
  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :password
  validates :email_address, {
    uniqueness: true,
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    }
  }
  validates :username, {
    uniqueness: true,
    length: { maximum: 12, minimum: 3 }
  }
end
