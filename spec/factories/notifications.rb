FactoryGirl.define do
  factory :notification do
    email false
    sms false
    user
  end
end
