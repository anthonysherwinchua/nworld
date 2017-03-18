class RolifyCreateRoles < ActiveRecord::Migration

  def change
    create_table(:roles) do |t|
      t.references :resource, :polymorphic => true

      t.string :name, index: true, null: false

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
    end

    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
  end

end
