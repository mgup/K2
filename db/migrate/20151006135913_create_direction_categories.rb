class CreateDirectionCategories < ActiveRecord::Migration
  def change
    create_table :direction_categories do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
