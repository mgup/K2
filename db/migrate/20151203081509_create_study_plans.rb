class CreateStudyPlans < ActiveRecord::Migration
  def change
    create_table :study_plans do |t|
      t.integer :part_id, index: true
      t.references :direction, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.string  :name
      t.string  :ind
      t.integer :admission_year

      t.timestamps null: false
    end
  end
end
