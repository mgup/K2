class CreateEducationDocuments < ActiveRecord::Migration
  def change
    create_table :education_documents do |t|
      t.references :person, polymorphic: true
      t.references :direction, index: true, foreign_key: true, null: false

      t.string :institution, null: false
      t.string :name, null: false
      t.string :series
      t.string :number, null: false
      t.integer :year_of_ending, null: false
      t.string :qualification

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
