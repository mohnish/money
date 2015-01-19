FactoryGirl.define do
  factory :payment do
    bill
    payment_source
    amount 9.99
  end
end
