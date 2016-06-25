class CreateModelDs < ActiveRecord::Migration
  def change
    create_table :model_ds do |t|
      t.integer :other_id
      t.integer :other_count
      t.timestamps null: false
    end
  end
end
