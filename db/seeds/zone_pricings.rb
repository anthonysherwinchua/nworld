prices = [1167, 1403, 1578, 1753, 1928, 2089, 2250, 2411, 2572, 2733, 2855, 2978, 3100, 3223, 3345, 3467, 3590, 3712,
          3834, 2957, 4061, 4165, 4270, 4374, 4478, 4583, 4687, 4791, 4896, 5000, 5104, 5209, 5313, 5417, 5522, 5626,
          5730, 5835, 5939, 6043, 6179, 6314, 6449, 6584, 6719, 6855, 6990, 7125, 7260, 7396, 7531, 7666, 7801, 7937,
          8072, 8207, 8342, 8478, 8613, 8748]

Zone.order(id: :asc).each do |zone|
  (0.5..30).step(0.5).each do |i|
    zp = ZonePricing.create!(zone: zone, weight: i, price: prices[i])
  end
end
