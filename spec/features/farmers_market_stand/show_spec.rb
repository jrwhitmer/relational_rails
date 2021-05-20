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

  it 'can display a count of produce items associated with each farmers market stand' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_content(@stand_1.produce_items_count)
  end

  it 'has a link to the farmers market stands index page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_link('Farmers Market Stands', href: '/farmers_market_stands')
  end

  it 'has a link to the produce items by farmers market stand selected page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

    visit "/farmers_market_stands/#{@stand_1.id}"

    expect(page).to have_link('Associated Produce Items', href: "/farmers_market_stands/#{@stand_1.id}/produce_items")
  end

  #user story 12
  it 'links to the edit page' do
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

    visit "/farmers_market_stands/#{@stand_2.id}"

    click_button "Update Devries Produc"

    expect(current_path).to eq("/farmers_market_stands/#{@stand_2.id}/edit")
  end

  it 'can update the farmers market stand' do
    @stand_2 = FarmersMarketStand.create!(name: "Devries Prod", city: "Olathe", seasonal: false, staffing: 5)

    visit "/farmers_market_stands/#{@stand_2.id}"

    expect(page).to have_content('Devries Prod')

    click_button 'Update Devries Prod'

    fill_in 'Name', with: "Devries Produce"
    click_button 'Submit'

    expect(current_path).to eq("/farmers_market_stands/#{@stand_2.id}")
    expect(page).to have_content('Devries Produce')
  end
end
