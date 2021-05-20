require 'rails_helper'

RSpec.describe 'produce items show page', type: :feature do
  it 'displays full produce detail' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)

    visit "/produce_items/#{@produce_item_1.id}"

    expect(page).to have_content(@produce_item_1.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_1.type)
    expect(page).to have_content(@produce_item_1.created_at)
    expect(page).to have_content(@produce_item_1.updated_at)
    expect(page).to have_content(@produce_item_1.weight)
    expect(page).to have_content(@produce_item_1.price_by_weight)
    expect(page).to have_content(@produce_item_1.organic)

    visit "/produce_items/#{@produce_item_2.id}"

    expect(page).to have_content(@produce_item_2.farmers_market_stand_id)
    expect(page).to have_content(@produce_item_2.type)
    expect(page).to have_content(@produce_item_2.created_at)
    expect(page).to have_content(@produce_item_2.updated_at)
    expect(page).to have_content(@produce_item_2.weight)
    expect(page).to have_content(@produce_item_2.price_by_weight)
    expect(page).to have_content(@produce_item_2.organic)
  end

  it 'has a link to the produce items index page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)

    visit "/produce_items/#{@produce_item_1.id}"

    expect(page).to have_link('Produce Items', href: '/produce_items')
  end

  it 'has a link to the farmers market stands index page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)
    @produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "cherries", weight: 2.4, price_by_weight: 7.18, organic: false)

    visit "/produce_items/#{@produce_item_2.id}"

    expect(page).to have_link('Farmers Market Stands', href: '/farmers_market_stands')
  end

  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"

  it 'has a link to update the produce item' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)

    visit "/produce_items/#{@produce_item_1.id}"

    expect(page).to have_link('Update Produce Item')
  end

  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:

  it 'can take the user to the edit page when update link is clicked' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)

    visit "/produce_items/#{@produce_item_1.id}"

    click_link('Update Produce Item')

    expect(current_path).to eq("/produce_items/#{@produce_item_1.id}/edit")
  end
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it 'can submit the edit form and take the user to produce items show page' do
    @stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)
    @produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", weight: 1.1, price_by_weight: 3.29, organic: true)

    visit "/produce_items/#{@produce_item_1.id}/edit"

    fill_in('Type', with: 'apples')
    fill_in('Weight', with: '2.5')
    fill_in('Price', with: '4.75')
    fill_in('Organic', with: '4.75')
    click_button('Update Produce Item')

    expect(current_path).to eq("/produce_items/#{@produce_item.id}")
    expect(page).to have_content('Honda Civic')
  end

end
