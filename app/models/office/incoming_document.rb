class Office::IncomingDocument < ActiveRecord::Base
  has_paper_trail

  belongs_to :document_source, class_name: 'Office::DocumentSource'
  belongs_to :document_type, class_name: 'Office::DocumentType'

  has_attached_file :document, preserve_files: true
  validates_attachment_content_type :document, content_type: 'application/pdf'

  scope :with_document_type, -> (id) { where(document_type_id: id) }
end
