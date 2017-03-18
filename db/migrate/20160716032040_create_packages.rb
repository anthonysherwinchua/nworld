class CreatePackages < ActiveRecord::Migration

  def change
    create_table :packages do |t|
      t.decimal :price, null: false, precision: 8, scale: 2
      t.decimal :worth, null: false, precision: 8, scale: 2

      t.timestamps null: false
    end
  end

end
