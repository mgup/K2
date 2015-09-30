# Номенклатура дел Общего отдела (типы обрабатываемых документов).
class Office::DocumentType < ActiveRecord::Base
  acts_as_paranoid

  scope :for_orders, -> {
    where(prefix: %w(01-03 01-03р 01-04 01-05 01-06 01-17 \
                     01-26 01-26р 01-36 01-37 01-38))
  }
end
