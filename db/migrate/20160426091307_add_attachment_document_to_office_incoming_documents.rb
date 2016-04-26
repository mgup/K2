class AddAttachmentDocumentToOfficeIncomingDocuments < ActiveRecord::Migration
  def change
    add_attachment :office_incoming_documents, :document
  end
end
