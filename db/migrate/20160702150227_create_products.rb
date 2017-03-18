class CreateProducts < ActiveRecord::Migration

  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true, null: false

      t.string :title, index: true, null: false
      t.string :unit, index: true, null: false
      t.string :directory_image
      t.decimal :price, null: false, precision: 8, scale: 2
      t.decimal :weight, null: false, precision: 5, scale: 2
      t.integer :status, default: 0, index: true, null: false
      t.text :description
      t.json :images

      t.timestamps null: false
    end
  end

end
