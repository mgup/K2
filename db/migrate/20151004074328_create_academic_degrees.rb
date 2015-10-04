class CreateAcademicDegrees < ActiveRecord::Migration
  def change
    create_table :academic_degrees do |t|
      t.string :name, null: false

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
