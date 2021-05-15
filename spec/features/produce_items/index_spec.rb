require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe 'produce items index page', type: :feature do
  it 'displays full produce detail' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)

    visit "/produce_items"

    expect(page).to have_content(@produce_item_1.type)
    expect(page).to have_content(@produce_item_1.weight)
    expect(page).to have_content(@produce_item_1.price_by_weight)
    expect(page).to have_content(@produce_item_1.organic)

    expect(page).to have_content(@produce_item_2.type)
    expect(page).to have_content(@produce_item_2.weight)
    expect(page).to have_content(@produce_item_2.price_by_weight)
    expect(page).to have_content(@produce_item_2.organic)
  end
end
