class CreateLineItemDiscounts < ActiveRecord::Migration

  def change
    create_table :line_item_discounts do |t|
      t.references :line_item, index: true, foreign_key: true

      t.string :source
      t.decimal :amount, null: false, precision: 8, scale: 2

      t.timestamps null: false
    end
  end

end
