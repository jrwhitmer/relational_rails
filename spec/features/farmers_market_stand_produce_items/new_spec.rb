require 'rails_helper'

# User Story 13, Parent Child Creation (x2)
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
RSpec.describe 'Parent Child Creation' do
  before(:each) do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
  end

  it 'has a link to add a new produce item for that farmers market stand' do

    visit "/farmers_market_stands/#{@stand_1.id}/produce_items"

    expect(page).to have_link("Create New Produce Item")
  end

  it 'takes user to a new page with a form to add a new produce item' do
    visit "/farmers_market_stands/#{@stand_1.id}/produce_items"

    click_link 'Create New Produce Item'

    expect(current_path).to eq("/farmers_market_stands/#{@stand_1.id}/produce_items/new")
  end

  it 'can submit the new produce item form and redirect user to the index page where the new item is listed' do

    visit "/farmers_market_stands/#{@stand_1.id}/produce_items/new"

    fill_in 'Type', with: 'basil'
    fill_in 'Weight', with: 0.75
    fill_in 'Price', with: 3.25
    fill_in 'Organic', with: true
    click_button 'Create Produce Item'

    expect(current_path).to eq("/farmers_market_stands/#{@stand_1.id}/produce_items")
    expect(page).to have_content('basil')
  end
end

# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
