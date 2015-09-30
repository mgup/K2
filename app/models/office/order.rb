class Office::Order < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :document_type, class_name: 'Office::DocumentType'

  has_attached_file :document, preserve_files: true
  validates_attachment_content_type :document, content_type: 'application/pdf'

  scope :with_document_type, -> (id) { where(document_type_id: id) }

  def full_number
    "#{document_type.prefix}/#{number}#{postfix}"
  end
end
