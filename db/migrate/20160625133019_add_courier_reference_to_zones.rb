class AddCourierReferenceToZones < ActiveRecord::Migration
  def change
    add_reference :zones, :courier, index: true, foreign_key: true
  end
end
