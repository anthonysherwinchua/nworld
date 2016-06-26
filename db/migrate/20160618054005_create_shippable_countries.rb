class CreateShippableCountries < ActiveRecord::Migration
  def change
    create_table :shippable_countries do |t|
      t.references :zone, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
