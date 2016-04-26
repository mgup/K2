class CreateOfficeDocumentSources < ActiveRecord::Migration
  def change
    create_table :office_document_sources do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
