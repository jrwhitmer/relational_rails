class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      add_reference :cars, :dealership, foreign_key: true
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :inspected
      t.float :price
    end
  end
end
