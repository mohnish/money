class Category < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :label, uniqueness: true
end
