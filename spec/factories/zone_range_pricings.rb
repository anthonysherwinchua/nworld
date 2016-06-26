FactoryGirl.define do
  factory :zone_range_pricing do

    zone
    weight_range { 1..200 }
    price '9.99'

    trait :invalid do
      price nil
    end

  end
end
