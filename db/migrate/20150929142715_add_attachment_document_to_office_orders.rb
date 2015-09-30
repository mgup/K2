class AddAttachmentDocumentToOfficeOrders < ActiveRecord::Migration
  def change
    add_attachment :office_orders, :document
  end
end
