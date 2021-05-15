require 'rails_helper'

RSpec.describe 'farmers market stands index page' do
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
end
