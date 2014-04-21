class User < ActiveRecord::Base
  has_many :expenses
  has_secure_password

  enum status: { unverified: 0, verified: 1 }

  validates :name, {
    presence: { message: 'Please enter your full name' },
    length: { maximum: 30, message: 'Sorry, we only allow 30 characters' }
  }

  validates :email, {
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
      message: 'Please enter a valid email address'
    },
    uniqueness: { message: 'The email address is taken' }
  }

end
