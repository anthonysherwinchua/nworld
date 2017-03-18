FactoryGirl.define do
  factory :category do
    sequence(:name) { |i| "Category #{i}" }

    trait :invalid do
      name ''
    end
  end
end
