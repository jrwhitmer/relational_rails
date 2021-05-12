class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :dealership_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :instpected
      t.float :price
    end
  end
end
