FactoryGirl.define do
  factory :user do

    sequence(:email) { |i| "email+#{i}@example.com" }
    password 'password123'

    after :create do |user|
      user.add_role :admin
    end

    trait :other_role do
      after :create do |user|
        user.remove_role :admin
        user.add_role :other
      end
    end

    trait :invalid do
      email nil
    end

  end
end
