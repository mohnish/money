FactoryGirl.define do
  factory :user do
    name "Expensive User"
    sequence(:email) { |n| "mail_#{n}@example.com" }
    password_digest "awesome_password_digest_123"
  end
end
