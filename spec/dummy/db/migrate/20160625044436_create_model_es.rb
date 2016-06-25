class CreateModelEs < ActiveRecord::Migration
  def change
    create_table :model_es do |t|
      t.references :model_d, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
