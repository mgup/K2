class CreateAcademicTitles < ActiveRecord::Migration
  def change
    create_table :academic_titles do |t|
      t.string :name, null: false

      t.date :deleted_at

      t.timestamps null: false
    end
  end
end
