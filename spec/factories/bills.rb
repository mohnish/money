FactoryGirl.define do
  factory :bill do
    user
    name "Food"
    next_due_date Time.now
    category
    repeat_interval
    amount 9.99
  end
end
