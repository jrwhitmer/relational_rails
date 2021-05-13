class CreateProduceItem < ActiveRecord::Migration[5.2]
  def change
    create_table :produces_items do |t|
      t.integer :farmers_market_stand_id
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
