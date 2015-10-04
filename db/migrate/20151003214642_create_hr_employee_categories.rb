class CreateHrEmployeeCategories < ActiveRecord::Migration
  def change
    create_table :hr_employee_categories do |t|
      t.string :name

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
