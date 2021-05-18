require 'rails_helper'

RSpec.describe 'farmers market stands index page', type: :feature do
  it 'can see all attribute names' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit '/farmers_market_stands'

    expect(page).to have_content(@stand_1.name)
    expect(page).to have_content(@stand_2.name)
  end

  it 'can see records are ordered by most recently created', type: :feature do
    @stand_1 = FarmersMarketStand.create!(created_at: DateTime.new(2021, 4, 12, 8, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(created_at: DateTime.new(2021, 4, 14, 9, 03, 30), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit '/farmers_market_stands'

    expect(page.body.split("<h3>").second).to have_content(@stand_1.name)
    expect(page.body.split("<h3>").third).to have_content(@stand_2.name)
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
