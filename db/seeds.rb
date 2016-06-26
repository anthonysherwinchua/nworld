files = ['users', 'couriers', 'zones', 'shippable_countries', 'zone_pricings']

files.each do |file|
  if file.singularize.camelize.constantize.count < 1
    puts "File: #{file}"
    require Rails.root + "db/seeds/#{file}.rb"
  else
    puts "Skipping File: #{file}"
  end
end
