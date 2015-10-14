class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.references :direction_category, indx: true, foreign_key: true,
                   null: false

      t.string :code
      t.string :name
      t.string :old_code
      t.string :old_qualification

      t.timestamps null: false
    end
  end
end
