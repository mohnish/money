FactoryGirl.define do
  factory :user do
    first_name 'james'
    last_name 'bond'
    email_address 'james@example.com'
    username 'jamesbond'
    avatar 'http://www.gravatar.com/avatar/b106a301f22e930c250012030d66912d'
    phone_number '9876543219'
    password 'test1234'
  end
end
