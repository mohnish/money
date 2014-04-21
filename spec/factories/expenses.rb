FactoryGirl.define do
  factory :expense do
    price 100.00
    sequence(:store) { |n| "store#{n}" }
    sequence(:comment) { |n| "comment#{n}" }
    user nil
  end
end
