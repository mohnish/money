class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :repeat_interval
  has_many :tags, as: :entity
  has_many :payments

end
