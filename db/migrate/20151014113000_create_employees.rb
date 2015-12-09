class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
