FactoryGirl.define do
  factory :package do
    price '9.99'
    worth '10'

    trait :invalid do
      worth '0'
    end
  end
end
