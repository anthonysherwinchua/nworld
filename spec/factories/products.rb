FactoryGirl.define do
  factory :product do
    association :category, factory: :category, strategy: :create

    sequence(:title) { |i| "Product Title #{i}" }
    description 'MyText'
    price '9.99'
    status :draft
    weight '9.99'
    unit 'Pack'

    trait :published do
      status :regular
    end

    trait :invalid do
      title ''
    end
  end
end
