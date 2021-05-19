class Car < ApplicationRecord
  belongs_to :dealership

  def self.by_true
    self.where('inspected = true')
  end
end
