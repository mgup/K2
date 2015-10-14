class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :main_department, index: true

      t.string :name
      t.string :abbreviation

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
