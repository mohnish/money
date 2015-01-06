FactoryGirl.define do
  factory :category do
    sequence :name do |n|
      "categoryname#{n}"
    end

    sequence :label do |n|
      "categorylabel#{n}"
    end
    image 'http://example.com/home.png'
  end
end
