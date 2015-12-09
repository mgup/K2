class CreateHrPositions < ActiveRecord::Migration
  def change
    create_table :hr_positions do |t|
      t.references :department, foreign_key: true, index: true, null: false
      t.references :qualification, index: true, null: false
      t.references :employee, foreign_key: true, index: true

      t.timestamps null: false
    end

    add_foreign_key :hr_positions, :hr_qualifications, column: :qualification_id
  end
end
