class CreateLinePackages < ActiveRecord::Migration

  def change
    create_table :line_packages do |t|
      t.references :cart, index: true, foreign_key: true, null: false
      t.references :package, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end

end
