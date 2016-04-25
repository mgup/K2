class CreateOfficeIncomingDocuments < ActiveRecord::Migration
  def change
    create_table :office_incoming_documents do |t|
      t.references :document_type, index: true, null: false
      t.integer :number, null: false
      t.string :suffix, null: true
      t.date :date, null: false
      t.string :title, null: false

      t.timestamps null: false
    end

    add_foreign_key :office_incoming_documents, :office_document_types,
                    column: :document_type_id
  end
end
