FactoryGirl.define do
  factory :courier do
    sequence(:name) { |i| "name #{i}" }

    trait :invalid do
      name nil
    end
  end
end
