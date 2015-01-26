FactoryGirl.define do
  factory :tag do
    sequence :name do |n|
      "#{['coffee', 'fun', 'food', 'online'].sample}#{n}"
    end

    entity factory: :bill
  end
end
