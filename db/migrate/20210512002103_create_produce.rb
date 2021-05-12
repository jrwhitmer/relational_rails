class CreateProduce < ActiveRecord::Migration[5.2]
  def change
    create_table :produces do |t|
      t.integer :market_id
      t.string :name
      t.string :type
      t.float :weight
      t.float :price_by_weight
      t.boolean :organic
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
