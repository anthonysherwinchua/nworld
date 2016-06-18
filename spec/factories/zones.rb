FactoryGirl.define do
  factory :zone do

    sequence(:name) { |i| "Zone ##{i}" }

    trait :invalid do
      name nil
    end

  end
end
