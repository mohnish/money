FactoryGirl.define do
  factory :repeat_interval do
    years 0
    months 2
    weeks 0
    days 0
    interval '2_months'
    label '2 months'
  end
end
