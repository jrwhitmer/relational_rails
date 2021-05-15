class ProduceItem < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :farmers_market_stand
end
