FactoryGirl.define do
  factory :courier do
    sequence(:name) { |i| "name #{i}" }
  end
end
