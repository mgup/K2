# noinspection RubyClassModuleNamingConvention
class AddDeletedAtToOfficeDocumentTypes < ActiveRecord::Migration
  def change
    add_column :office_document_types, :deleted_at, :datetime
    add_index :office_document_types, :deleted_at
  end
end
