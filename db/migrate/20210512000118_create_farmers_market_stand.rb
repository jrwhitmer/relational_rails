class CreateFarmersMarketStands < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers_market_stands do |t|
      t.string :name
      t.string :city
      t.boolean :seasonal
      t.integer :staffing
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
