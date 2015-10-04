class CreateRoleTables < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string   :name,                   null: false
      t.string   :authorizable_type,      null: true
      t.integer  :authorizable_id,        null: true
      t.boolean  :system, default: false, null: false
      t.timestamps                        null: false
    end

    add_index :roles, :name
    add_index :roles, [:authorizable_type, :authorizable_id]

    create_table :roles_users, id: false do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :role, index: true, foreign_key: true, null: false
    end
  end
end
