FactoryGirl.define do
  factory :shippable_country do
    association :zone, factory: :zone, strategy: :create

    sequence(:name) { |i| "Country ##{i}" }

    trait :invalid do
      name ''
    end

  end
end
