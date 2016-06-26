dhl_courier = Courier.find_by(name: "DHL")

1.upto(10) do |index|
  Zone.create!(name: "Zone #{index}", courier: dhl_courier)
end
