class CreateMaritalStatuses < ActiveRecord::Migration
  def change
    create_table :marital_statuses do |t|
      t.string :name

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
