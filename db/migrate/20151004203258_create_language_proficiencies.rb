class CreateLanguageProficiencies < ActiveRecord::Migration
  def change
    create_table :language_proficiencies do |t|
      t.string :name, null: false

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
