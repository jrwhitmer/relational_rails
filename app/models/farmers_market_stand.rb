class FarmersMarketStand < ApplicationRecord
  has_many :produce_items

  def produce_items_count
    self.produce_items.count
  end
end
