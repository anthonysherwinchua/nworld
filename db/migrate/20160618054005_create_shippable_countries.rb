class CreateShippableCountries < ActiveRecord::Migration

  def change
    create_table :shippable_countries do |t|
      t.references :zone, index: true, foreign_key: true, null: false

      t.string :name, index: true, null: false

      t.timestamps null: false
    end
  end

end
