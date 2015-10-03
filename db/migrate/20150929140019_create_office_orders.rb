class CreateOfficeOrders < ActiveRecord::Migration
  def change
    create_table :office_orders do |t|
      t.references :document_type, index: true
      t.integer :number
      t.string :suffix, null: true, default: nil
      t.date :date
      t.string :title

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
