FactoryGirl.define do
  factory :shippable_country do

    zone
    sequence(:name) { |i| "Country ##{i}" }

    trait :invalid do
      name nil
    end

  end
end
