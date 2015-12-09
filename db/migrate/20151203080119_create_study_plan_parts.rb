class CreateStudyPlanParts < ActiveRecord::Migration
  def change
    create_table :study_plan_parts do |t|
      t.integer :parent_id, index: true

      t.string :name
      t.string :ind

      t.timestamps null: false
    end
  end
end
