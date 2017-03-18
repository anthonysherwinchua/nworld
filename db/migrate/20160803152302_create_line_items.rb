class CreateLineItems < ActiveRecord::Migration

  def change
    create_table :line_items do |t|
      t.references :cart, index: true, foreign_key: true, null: false
      t.references :line_package, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true, null: false

      t.integer :quantity, default: 0, null: false

      t.timestamps null: false
    end
  end

end
