require 'rails_helper'

RSpec.describe 'the FarmersMarketStand creation' do

#user_story 11
  it 'links to the new page from the FarmersMarketStand index' do
    visit '/farmers_market_stands'

    click_link('New Farmers Market Stand')
    expect(current_path).to eq('/farmers_market_stands/new')
  end

  it 'can create a new farmers market stand' do
      visit '/farmers_market_stands/new'

      fill_in('Name', with: 'Red Wagon Organic Farm') #execution
      click_button('Create Farmers Market Stand')

      expect(current_path).to eq("/farmers_market_stands") #expectation
      expect(page).to have_content("Red Wagon Organic Farm")
    end
end
