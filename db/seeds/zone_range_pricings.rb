lbc_courier = Courier.find_by(name: "LBC")

metro_manila = Zone.create!(name: "Metro Manila", courier: lbc_courier)
luzon = Zone.create!(name: "Luzon", courier: lbc_courier)
visayas = Zone.create!(name: "Visayas", courier: lbc_courier)
mindanao = Zone.create!(name: "Mindanao", courier: lbc_courier)

ShippableCountry.create!(name: 'Philippines - Metro Manila', zone_id: metro_manila.id)
ShippableCountry.create!(name: 'Philippines - Luzon', zone_id: luzon.id)
ShippableCountry.create!(name: 'Philippines - Visayas', zone_id: visayas.id)
ShippableCountry.create!(name: 'Philippines - Mindanao', zone_id: mindanao.id)

range = Range.new(1, 99999)
metro_manila.zone_range_pricings.create!(weight_range: range, price: -1)
luzon.zone_range_pricings.create!(weight_range: range, price: 165)
visayas.zone_range_pricings.create!(weight_range: range, price: 175)
mindanao.zone_range_pricings.create!(weight_range: range, price: 185)

