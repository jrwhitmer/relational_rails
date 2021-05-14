class CreateProduceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :produce_items do |t|
      t.integer :farmers_market_stand_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :type
      t.float :weight
      t.float :price_by_weight
      t.boolean :organic
    end
  end
end
