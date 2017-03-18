FactoryGirl.define do
  factory :zone do
    association :courier, factory: :courier, strategy: :create
    sequence(:name) { |i| "Zone ##{i}" }

    trait :invalid do
      name ''
    end

  end
end
