class Tag < ActiveRecord::Base
  belongs_to :expense

  validates :name, { presence: true }
end
