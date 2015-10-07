class CreateOfficeOrders < ActiveRecord::Migration
  def change
    create_table :office_orders do |t|
      t.references :document_type, foreign: true, index: true, null: false
      t.integer :number, null: false
      t.string :suffix, null: true
      t.date :date, null: false
      t.string :title, null: false

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
