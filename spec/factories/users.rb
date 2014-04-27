FactoryGirl.define do
  factory :user do
    name "Expensive User"
    sequence(:email) { |n| "mail_#{n}@example.com" }
    password_digest "awesome_password_digest_123"
  end

  # Tip: This can be done even by nesting this inside the above defined
  # factory, but, this looks more clear
  factory :user_with_expenses, parent: :user do
    ignore do
      expenses_count 5
    end

    after(:create) do |user, evaluator|
      create_list(:expense, evaluator.expenses_count, user: user)
    end
  end
end
