class CreateStudyClasses < ActiveRecord::Migration
  def change
    create_table :study_classes do |t|
      t.integer :plan_id, index: true

      t.integer :semester
      t.integer :type
      t.integer :hours

      t.timestamps null: false
    end
  end
end
