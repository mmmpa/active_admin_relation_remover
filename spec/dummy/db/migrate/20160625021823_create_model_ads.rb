class CreateModelAds < ActiveRecord::Migration
  def change
    create_table :model_ads do |t|
      t.references :model_a, index: true, foreign_key: true
      t.references :model_d, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
