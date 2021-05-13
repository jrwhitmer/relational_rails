require 'rails_helper'
#   As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

RSpec.describe 'farmers market stands index page' do
  it 'can display farmers market stands and their attributes on the id page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_content(@stand_1.name)
    # expect(page).to have_content(stand_1.created_at)
    # expect(page).to have_content(stand_1.updated_at)
    # expect(page).to have_content(@stand_1.city)
    # expect(page).to have_content(@stand_1.seasonal)
    # expect(page).to have_content(@stand_1.staffing)
  end
end
