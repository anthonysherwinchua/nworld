FactoryGirl.define do
  factory :courier do
    sequence(:name) { |i| "name #{i}" }

    trait :invalid do
      name ''
    end
  end
end
