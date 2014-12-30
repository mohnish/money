class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email_address
end
