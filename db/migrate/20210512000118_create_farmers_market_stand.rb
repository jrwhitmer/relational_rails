class CreateFarmersMarketStand < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers_market_stands do |t|
      t.string :name
      t.string :city
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :seasonal
      t.integer :staffing
    end
  end
end
