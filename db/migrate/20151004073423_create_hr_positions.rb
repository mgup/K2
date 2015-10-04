class CreateHrPositions < ActiveRecord::Migration
  def change
    create_table :hr_positions do |t|
      t.references :employee_category, index: true, foreign_key: true, null: false
      t.string :name, null: false

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
