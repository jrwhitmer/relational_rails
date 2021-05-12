class CreateFarmersMarketStand < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers_market_stands do |t|
      t.string :title
      t.string :description
    end
  end
end
