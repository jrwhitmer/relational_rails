require 'rails_helper'

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

RSpec.describe 'parent child index page' do
  it 'can display all produce items and their attributes associated with the farmers market stand id' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)
    @produce_item_3 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "corn", weight: 3.2, price_by_weight: 6.37, organic: false)
    @produce_item_4 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "peaches", weight: 2.9, price_by_weight: 8.67, organic: true)

    visit "/farmers_market_stands/#{@stand_1.id}/produce_items"

    expect(page).to have_content(@produce_item_1.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_1.type)
    expect(page).to have_content(@produce_item_1.created_at)
    expect(page).to have_content(@produce_item_1.updated_at)
    expect(page).to have_content(@produce_item_1.weight)
    expect(page).to have_content(@produce_item_1.price_by_weight)
    expect(page).to have_content(@produce_item_1.organic)

    expect(page).to have_content(@produce_item_2.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_2.type)
    expect(page).to have_content(@produce_item_2.created_at)
    expect(page).to have_content(@produce_item_2.updated_at)
    expect(page).to have_content(@produce_item_2.weight)
    expect(page).to have_content(@produce_item_2.price_by_weight)
    expect(page).to have_content(@produce_item_2.organic)

    visit "/farmers_market_stands/#{@stand_2.id}/produce_items"

    expect(page).to have_content(@produce_item_3.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_3.type)
    expect(page).to have_content(@produce_item_3.created_at)
    expect(page).to have_content(@produce_item_3.updated_at)
    expect(page).to have_content(@produce_item_3.weight)
    expect(page).to have_content(@produce_item_3.price_by_weight)
    expect(page).to have_content(@produce_item_3.organic)

    expect(page).to have_content(@produce_item_4.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_4.type)
    expect(page).to have_content(@produce_item_4.created_at)
    expect(page).to have_content(@produce_item_4.updated_at)
    expect(page).to have_content(@produce_item_4.weight)
    expect(page).to have_content(@produce_item_4.price_by_weight)
    expect(page).to have_content(@produce_item_4.organic)
  end
end
