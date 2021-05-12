class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :open
      t.integer :max_car_capacity
    end
  end
end
