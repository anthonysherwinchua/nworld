FactoryGirl.define do
  factory :zone_pricing do
    association :zone, factory: :zone, strategy: :create

    weight_min { rand(9999) }
    weight_max { rand(9999) }
    price { rand(0.5..9000.0) }

    trait :invalid do
      weight_min ''
      weight_max ''
      price ''
    end

  end
end
