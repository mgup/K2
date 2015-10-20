class CreateDepartmentsOfficeOrders < ActiveRecord::Migration
  def change
    create_table :departments_office_orders do |t|
      t.belongs_to :department, index: true
      t.belongs_to :order, index: true
    end
  end
end
