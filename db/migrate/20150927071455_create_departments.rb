class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :parent_id, index: true

      t.string :name
      t.string :abbreviation

      t.timestamps null: false
    end
  end
end
