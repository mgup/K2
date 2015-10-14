class CreateAcademicTitles < ActiveRecord::Migration
  def change
    create_table :academic_titles do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
