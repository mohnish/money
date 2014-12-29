FactoryGirl.define do
  factory :payment_source do
    user
    name "Chase Bank"
    type "DebitCard"
  end
end
