FactoryGirl.define do
  factory :user do
    first_name 'james'
    last_name 'bond'

    sequence :email_address do |n|
      "james#{n}@example.com"
    end

    sequence :username do |n|
      "jamesbond#{n}"
    end

    avatar 'http://www.gravatar.com/avatar/b106a301f22e930c250012030d66912d'
    phone_number '9876543219'
    password 'test1234'
  end
end
