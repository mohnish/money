FactoryGirl.define do
  factory :note do
    content ""
    entity factory: debit_card
  end
end
