class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
