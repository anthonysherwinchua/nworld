FactoryGirl.define do
  factory :zone_pricing do

    zone
    weight { rand(9999) }
    price { rand(0.5..20_000.0) }

    trait :invalid do
      weight nil
    end

  end
end
