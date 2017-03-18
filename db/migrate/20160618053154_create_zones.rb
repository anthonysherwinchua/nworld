class CreateZones < ActiveRecord::Migration

  def change
    create_table :zones do |t|
      t.references :courier, index: true, foreign_key: true, null: false

      t.string :name, index: true, null: false

      t.timestamps null: false
    end
  end

end
