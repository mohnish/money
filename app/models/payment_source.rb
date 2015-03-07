class PaymentSource < ActiveRecord::Base
  belongs_to :user
  has_many :payments

  validates_presence_of :user
  validates_uniqueness_of :name, scope: [:type, :user]
end
