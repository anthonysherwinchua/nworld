FactoryGirl.define do
  factory :product do
    association :category, factory: :category, strategy: :build

    sequence(:title) { |i| "Product Title #{i}" }
    description 'MyText'
    price '9.99'
    status :draft
    weight '9.99'
    unit 'Pack'

    trait :invalid do
      title nil
    end
  end
end
