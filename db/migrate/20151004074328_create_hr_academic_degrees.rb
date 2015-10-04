class CreateHrAcademicDegrees < ActiveRecord::Migration
  def change
    create_table :hr_academic_degrees do |t|
      t.string :name

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
