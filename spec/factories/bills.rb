FactoryGirl.define do
  factory :bill do
    name ['Netflix', 'GitHub', 'Credit Card', 'Library', 'Gym'].sample
    status 0
    next_due_date 5.days.since
    amount [9.99, 24.99, 30.00, 7].sample
    repeat_interval
    category
    user

    factory :bill_with_tags do
      transient do
        tags_count 3
      end

      after(:create) do |bill, evaluator|
        create_list(:tag, evaluator.tags_count, entity: bill)
      end
    end
  end
end
