require 'rails_helper'

RSpec.describe 'produce items show page', type: :feature do
  it 'displays full produce detail' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)

    visit "/produce_items/#{@produce_item_1.id}"

    expect(page).to have_content(@produce_item_1.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_1.type)
    expect(page).to have_content(@produce_item_1.created_at)
    expect(page).to have_content(@produce_item_1.updated_at)
    expect(page).to have_content(@produce_item_1.weight)
    expect(page).to have_content(@produce_item_1.price_by_weight)
    expect(page).to have_content(@produce_item_1.organic)

    visit "/produce_items/#{@produce_item_2.id}"

    expect(page).to have_content(@produce_item_2.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_2.type)
    expect(page).to have_content(@produce_item_2.created_at)
    expect(page).to have_content(@produce_item_2.updated_at)
    expect(page).to have_content(@produce_item_2.weight)
    expect(page).to have_content(@produce_item_2.price_by_weight)
    expect(page).to have_content(@produce_item_2.organic)
  end
end
