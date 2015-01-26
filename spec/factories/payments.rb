FactoryGirl.define do
  factory :payment do
    amount 9.99
    payment_source
    bill
  end
end
