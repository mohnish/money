class Payment < ActiveRecord::Base
  belongs_to :bill
  belongs_to :payment_source
end
