FactoryGirl.define do
  factory :payment_source do
    user

    sequence :name do |n|
      "Wells Fargo Check Card #{n}"
    end

    type "DebitCard"

    factory :debit_card do
      sequence :name do |n|
        "Bank Of America ATM Card #{n}"
      end
    end

    factory :credit_card do
      sequence :name do |n|
        "Chase Freedom Credit Card #{n}"
      end

      type "CreditCard"
    end

    factory :cash do
      sequence :name do |n|
        "Cash #{n}"
      end

      type "Cash"
    end
  end
end
