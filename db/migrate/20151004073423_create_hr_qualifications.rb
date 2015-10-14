class CreateHrQualifications < ActiveRecord::Migration
  def change
    create_table :hr_qualifications do |t|
      t.references :employee_category, index: true, foreign_key: true, null: false

      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
