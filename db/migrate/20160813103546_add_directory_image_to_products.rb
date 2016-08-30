class AddDirectoryImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :directory_image, :string
  end
end
