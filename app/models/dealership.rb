class Dealership < ApplicationRecord
  has_many :cars

  def cars_count
    self.cars.count
  end
end
