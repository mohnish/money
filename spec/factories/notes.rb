FactoryGirl.define do
  factory :note do
    content 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'
    entity factory: :credit_card
  end
end
