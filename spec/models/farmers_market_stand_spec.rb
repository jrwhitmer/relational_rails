require 'rails_helper'

RSpec.describe FarmersMarketStand do
  it {should have_many :produce_items}

  describe 'instance methods' do
    describe '#produce_item_count'do
      before :each do
        @stand_1 = FarmersMarketStand.create!(created_at: DateTime.new(2021, 4, 12, 8, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
        @stand_2 = FarmersMarketStand.create!(created_at: DateTime.new(2021, 4, 14, 9, 03, 30), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
        @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
        @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)
        @produce_item_3 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "corn", weight: 3.2, price_by_weight: 6.37, organic: false)
      end

      it 'shows the number of produce items associated with farmers market stand' do
        expect(@stand_1.produce_items_count).to eq(2)
        expect(@stand_2.produce_items_count).to eq(1)
      end
    end
  end
end
