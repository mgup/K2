# Номенклатура дел Общего отдела (типы обрабатываемых документов).
class Office::DocumentType < ActiveRecord::Base
  has_paper_trail

  has_many :orders, class_name: 'Office::Order'

  scope :for_orders, lambda {
    where(prefix: %w(01-03 01-03р 01-04 01-05 01-06 01-17 \
                     01-26 01-26р 01-36 01-37 01-38))
  }

  scope :for_incoming_documents, lambda {
    where(prefix: %w(01-10 01-11 01-12 01-13 01-14 \
                     01-15 01-18 01-19 01-20))
  }
end
