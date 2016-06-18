class CreateZonePricings < ActiveRecord::Migration
  def change
    create_table :zone_pricings do |t|
      t.references :zone, index: true, foreign_key: true
      t.integer :weight
      t.decimal :price

      t.timestamps null: false
    end
  end
end
