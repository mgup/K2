class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.references :person, polymorphic: true
      t.references :relationship, index: true, foreign_key: true, null: false

      t.string :name
      t.integer :year_of_birth

      t.timestamps null: false
    end
  end
end
