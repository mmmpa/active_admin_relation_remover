class CreateModelBs < ActiveRecord::Migration
  def change
    create_table :model_bs do |t|
      t.references :admin_user, index: true, foreign_key: true
      t.references :model_a, index: true, foreign_key: true
      t.string :column_a
      t.integer :column_b
      t.boolean :column_c

      t.timestamps null: false
    end
  end
end
