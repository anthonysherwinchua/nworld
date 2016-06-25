FactoryGirl.define do
  factory :zone do
    association :courier, factory: :courier, strategy: :build
    sequence(:name) { |i| "Zone ##{i}" }

    trait :invalid do
      name nil
    end

  end
end
