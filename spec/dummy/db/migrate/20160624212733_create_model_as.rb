class CreateModelAs < ActiveRecord::Migration
  def change
    create_table :model_as do |t|
      t.references :admin_user, index: true, foreign_key: true
      t.string :column_a
      t.integer :column_b
      t.boolean :column_c

      t.timestamps null: false
    end
  end
end
