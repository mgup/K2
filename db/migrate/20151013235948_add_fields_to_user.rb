class AddFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :patronymic

      t.date :birthdate
      t.string :birthplace
      t.integer :sex, default: 1, null: false

      t.references :citizenship, index: true, foreign_key: true
      t.references :education_level, index: true, foreign_key: true
      t.references :academic_degree, index: true, foreign_key: true
      t.references :academic_title, index: true, foreign_key: true
      t.references :marital_status, index: true, foreign_key: true
    end
  end
end
