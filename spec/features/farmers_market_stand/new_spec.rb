require 'rails_helper'

RSpec.describe 'the FarmersMarketStand creation' do

#user_story 11
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
  it 'links to the new page from the FarmersMarketStand index' do
    visit '/farmers_market_stands'

    click_link('New Farmers Market Stand')
    expect(current_path).to eq('/farmers_market_stands/new')
  end

  it 'can create a new farmers market stand' do
      visit '/farmers_market_stands/new'
      #
      fill_in('Name', with: 'Red Wagon Organic Farm') #execution
      click_button('Create Farmers Market Stand')
      #
      expect(current_path).to eq("/farmers_market_stands") #expectation
      expect(page).to have_content("Red Wagon Organic Farm")
    end

# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
end
