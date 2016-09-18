class AddShippableCountryToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :shippable_country, index: true, foreign_key: true
    add_column :carts, :first_name, :string, default: ''
    add_column :carts, :last_name, :string, default: ''
    add_column :carts, :address, :string, default: ''
    add_column :carts, :city, :string, default: ''
    add_column :carts, :zip_code, :string, default: ''
    add_column :carts, :contact_number, :string, default: ''
  end
end
