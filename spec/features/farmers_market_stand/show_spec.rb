require 'rails_helper'

RSpec.describe 'farmers market stands show page' do
  it 'can display farmers market stands and their attributes on the id page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_content(@stand_1.name)
    expect(page).to have_content(@stand_1.created_at)
    expect(page).to have_content(@stand_1.updated_at)
    expect(page).to have_content(@stand_1.city)
    expect(page).to have_content(@stand_1.seasonal)
    expect(page).to have_content(@stand_1.staffing)
  end

  it 'has a link to the produce items index page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_link('Produce Items', href: '/produce_items')
  end

  it 'has a link to the farmers market stands index page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_link('Farmers Market Stands', href: '/farmers_market_stands')
  end
end
