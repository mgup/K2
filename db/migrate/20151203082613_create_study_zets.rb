class CreateStudyZets < ActiveRecord::Migration
  def change
    create_table :study_zets do |t|
      t.integer :plan_id, index: true

      t.integer :semester
      t.float   :amount

      t.timestamps null: false
    end
  end
end
