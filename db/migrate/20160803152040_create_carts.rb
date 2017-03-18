class CreateCarts < ActiveRecord::Migration

  def change
    create_table :carts do |t|
      t.references :shippable_country, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :contact_number

      t.timestamps null: false
    end
  end

end
