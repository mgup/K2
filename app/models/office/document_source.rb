class Office::DocumentSource < ActiveRecord::Base
  has_paper_trail

  has_many :incoming_documents, class_name: 'Office::IncomingDocument'

  default_scope { order(:name) }
end
