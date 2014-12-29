class Bill < ActiveRecord::Base
  belongs_to :category
  belongs_to :repeat_interval
end
