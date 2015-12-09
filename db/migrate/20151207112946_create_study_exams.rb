class CreateStudyExams < ActiveRecord::Migration
  def change
    create_table :study_exams do |t|
      t.integer :plan_id, index: true

      t.integer :semester
      t.integer :type

      t.timestamps null: false
    end
  end
end
