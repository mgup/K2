class CreateHrForeignLanguages < ActiveRecord::Migration
  def change
    create_table :hr_foreign_languages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.references :language_proficiency, index: true, foreign_key: true

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
