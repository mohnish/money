FactoryGirl.define do
  factory :bill do
    user
    name ['Netflix', 'GitHub', 'Credit Card', 'Library', 'Gym'].sample
    next_due_date 5.days.since
    category
    repeat_interval
    amount [9.99, 24.99, 30.00, 7].sample
  end
end
