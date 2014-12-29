FactoryGirl.define do
  factory :tag do
    name 'tea'
    entity factory: :bill
  end
end
