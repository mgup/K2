class CreateOfficeDocumentTypes < ActiveRecord::Migration
  def change
    create_table :office_document_types do |t|
      t.string :prefix
      t.string :name

      t.timestamps null: false
    end
  end
end
