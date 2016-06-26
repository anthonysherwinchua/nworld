FactoryGirl.define do
  factory :zone_range_pricing do
    weight_range { 1.upto(rand(999)) }
    price "9.99"
  end
end
