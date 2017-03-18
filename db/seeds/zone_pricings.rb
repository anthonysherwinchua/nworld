prices = [1167, 1403, 1578, 1753, 1928, 2089, 2250, 2411, 2572, 2733, 2855, 2978, 3100, 3223, 3345, 3467, 3590, 3712,
          3834, 2957, 4061, 4165, 4270, 4374, 4478, 4583, 4687, 4791, 4896, 5000, 5104, 5209, 5313, 5417, 5522, 5626,
          5730, 5835, 5939, 6043, 6179, 6314, 6449, 6584, 6719, 6855, 6990, 7125, 7260, 7396, 7531, 7666, 7801, 7937,
          8072, 8207, 8342, 8478, 8613, 8748]

Zone.order(id: :asc).each do |zone|
  i = 0
  (0.5..30.5).step(0.5).each_cons(2) do |min, max|
    ZonePricing.create!(zone: zone, weight_min: min, weight_max: max - 0.01, price: prices[i])
    i += 1
  end
end

lbc_courier = Courier.find_by(name: "LBC")

metro_manila = Zone.create!(name: "Metro Manila", courier: lbc_courier)
luzon = Zone.create!(name: "Luzon", courier: lbc_courier)
visayas = Zone.create!(name: "Visayas", courier: lbc_courier)
mindanao = Zone.create!(name: "Mindanao", courier: lbc_courier)

ShippableCountry.create!(name: 'Philippines - Metro Manila', zone_id: metro_manila.id)
ShippableCountry.create!(name: 'Philippines - Luzon', zone_id: luzon.id)
ShippableCountry.create!(name: 'Philippines - Visayas', zone_id: visayas.id)
ShippableCountry.create!(name: 'Philippines - Mindanao', zone_id: mindanao.id)

range = Range.new(1, 9999)
metro_manila.zone_pricings.create!(weight_min: range.min, weight_max: range.max, price: 0.51)
luzon.zone_pricings.create!(weight_min: range.min, weight_max: range.max, price: 165)
visayas.zone_pricings.create!(weight_min: range.min, weight_max: range.max, price: 175)
mindanao.zone_pricings.create!(weight_min: range.min, weight_max: range.max, price: 185)
