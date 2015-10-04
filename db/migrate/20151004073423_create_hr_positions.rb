class CreateHrPositions < ActiveRecord::Migration
  def change
    create_table :hr_positions do |t|
      t.references :employee_category, index: true
      t.string :name

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
