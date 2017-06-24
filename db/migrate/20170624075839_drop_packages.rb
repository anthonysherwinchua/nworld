class DropPackages < ActiveRecord::Migration

  def change
    remove_reference :line_items, :line_package, index: true, foreign_key: true
    drop_table :line_packages
    drop_table :packages
  end

end
