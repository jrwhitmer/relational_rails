require 'rails_helper'

RSpec.describe 'dealerships index page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)
    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)
  end

  it 'can view the name of each dealership in the system' do
    visit '/dealerships'

    expect(page).to have_content(@dealership_1.name)
    expect(page).to have_content(@dealership_2.name)
  end

  it 'can view the sorted names of each dealership in the system' do
    visit '/dealerships'

    expect(page.body.split("<p>").second).to have_content(@dealership_2.name)
    expect(page.body.split("<p>").fourth).to have_content(@dealership_1.name)
  end

  it 'has a link to the cars index page' do
    visit '/dealerships'

    expect(page).to have_link('Cars', href: '/cars')
  end

  it 'has a link to the dealerships index page' do
    visit '/dealerships'

    expect(page).to have_link('Dealerships', href: '/dealerships')
  end

  it 'has a link to create a new dealership form page' do
    visit '/dealerships'

    expect(page).to have_button('New Dealership')
  end

  it 'takes user to dealership/new when new dealership button is clicked' do
    visit '/dealerships'
    click_button 'New Dealership'

    expect(current_path).to eq('/dealerships/new')
  end

  it 'can submit a filled in form for new dealership and redirects user to dealership index page' do
    visit '/dealerships/new'
    fill_in 'Name', with: 'Sydney Hardy Toyota'
    fill_in 'Open', with: 'false'
    fill_in 'Max Car Capacity', with: '50'
    click_button 'Create Dealership'

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content('Sydney Hardy Toyota')
  end

  it 'has a link by each dealership to the edit page for that dealership' do

    visit '/dealerships'

    expect(page).to have_link('Edit', href: "/dealerships/#{@dealership_1.id}/edit")
    expect(page).to have_link('Edit', href: "/dealerships/#{@dealership_2.id}/edit")

    click_link('Edit', href: "/dealerships/#{@dealership_1.id}/edit")

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}/edit")

    visit '/dealerships'

    click_link('Edit', href: "/dealerships/#{@dealership_2.id}/edit")

    expect(current_path).to eq("/dealerships/#{@dealership_2.id}/edit")
  end
end
