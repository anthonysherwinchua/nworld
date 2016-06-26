class CreateZoneRangePricings < ActiveRecord::Migration
  def change
    create_table :zone_range_pricings do |t|
      t.references :zone, index: true, foreign_key: true
      t.text :weight_range
      t.decimal :price

      t.timestamps null: false
    end
  end
end
