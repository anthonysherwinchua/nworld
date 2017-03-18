class CreateZonePricings < ActiveRecord::Migration

  def change
    create_table :zone_pricings do |t|
      t.references :zone, index: true, foreign_key: true, null: false

      t.decimal :price, null: false, precision: 6, scale: 2
      t.decimal :weight_min, null: false, precision: 6, scale: 2
      t.decimal :weight_max, null: false, precision: 6, scale: 2

      t.timestamps null: false
    end
  end

end
