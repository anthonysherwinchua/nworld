class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.decimal :price
      t.decimal :worth

      t.timestamps null: false
    end
  end
end
