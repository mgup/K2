# Номенклатура дел Общего отдела (типы обрабатываемых документов).
class Office::DocumentType < ActiveRecord::Base
  acts_as_paranoid
end
