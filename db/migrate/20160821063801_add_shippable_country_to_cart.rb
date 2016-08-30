class AddShippableCountryToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :shippable_country, index: true, foreign_key: true
  end
end
