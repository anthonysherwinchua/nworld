class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :status, default: 0
      t.decimal :weight
      t.references :category, index: true, foreign_key: true
      t.string :unit

      t.timestamps null: false
    end
  end
end
