class PaymentSource < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_uniqueness_of :name, scope: [:type, :user]
end
