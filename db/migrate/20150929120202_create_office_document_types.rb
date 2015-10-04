class CreateOfficeDocumentTypes < ActiveRecord::Migration
  def change
    create_table :office_document_types do |t|
      t.string :prefix, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
