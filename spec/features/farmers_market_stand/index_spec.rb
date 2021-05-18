require 'rails_helper'

RSpec.describe 'farmers market stands index page', type: :feature do
  it 'can see all attribute names' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit '/farmers_market_stands'

    expect(page).to have_content(@stand_1.name)
    expect(page).to have_content(@stand_2.name)
  end

  it 'has a link to the produce items index page' do
    visit "/farmers_market_stands"

    expect(page).to have_link('Produce Items', href: '/produce_items')
  end

  it 'has a link to the farmers market stands index page' do
    visit "/farmers_market_stands"

    expect(page).to have_link('Farmers Market Stands', href: '/farmers_market_stands')
  end
end
