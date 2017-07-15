class AddUnitPriceToLineItem < ActiveRecord::Migration

  def change
    add_column :line_items, :unit_price, :decimal, null: false, precision: 8, scale: 2
  end

end
