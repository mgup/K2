class CreateCitizenships < ActiveRecord::Migration
  def change
    create_table :citizenships do |t|
      t.string :name, null: false

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
