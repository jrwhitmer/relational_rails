class CreateProduceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :produce_items do |t|
      add_reference :produce_items, :farmers_market_stand, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
      t.string :type
      t.float :weight
      t.float :price_by_weight
      t.boolean :organic
    end
  end
end
