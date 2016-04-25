class Office::IncomingDocument < ActiveRecord::Base
  has_paper_trail

  belongs_to :document_type, class_name: 'Office::DocumentType'

  scope :with_document_type, -> (id) { where(document_type_id: id) }
end
