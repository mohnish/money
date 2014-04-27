class Expense < ActiveRecord::Base
  belongs_to :user
  has_many :tags

  validates :price, {
    presence: { message: 'Please enter a price' },
    numericality: { message: 'Please enter a valid price' }
  }
  validates :store, { presence: { message: 'Please enter a store name' } }
end
