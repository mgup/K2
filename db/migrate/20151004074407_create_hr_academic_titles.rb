class CreateHrAcademicTitles < ActiveRecord::Migration
  def change
    create_table :hr_academic_titles do |t|
      t.string :name

      t.date :deleted_at

      t.timestamps null: false
    end
  end
end
