FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
    expense nil
  end
end
