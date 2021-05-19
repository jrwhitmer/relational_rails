require 'rails_helper'

RSpec.describe 'dealerships show page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)
    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)

    @car_1 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Fusion", created_at: DateTime.new(2015, 6, 22, 9, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 15999.99)

    @car_2 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Explorer", created_at: DateTime.new(2012, 8, 12, 7, 30, 19), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 11999.99)

    @car_3 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M3", created_at: DateTime.new(2005, 7, 24, 10, 05, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 22999.99)

    @car_4 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M6", created_at: DateTime.new(2002, 3, 2, 6, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 32999.99)
  end

  it 'can display dealerships and their attributes on id page' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_content(@dealership_1.name)
    expect(page).to have_content(@dealership_1.created_at)
    expect(page).to have_content(@dealership_1.updated_at)
    expect(page).to have_content(@dealership_1.open)
    expect(page).to have_content(@dealership_1.max_car_capacity)

    visit "/dealerships/#{@dealership_2.id}"

    expect(page).to have_content(@dealership_2.name)
    expect(page).to have_content(@dealership_2.created_at)
    expect(page).to have_content(@dealership_2.updated_at)
    expect(page).to have_content(@dealership_2.open)
    expect(page).to have_content(@dealership_2.max_car_capacity)
  end

  it 'can display a count of cars associated with each dealership' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_content(@dealership_1.cars_count)

    visit "/dealerships/#{@dealership_2.id}"

    expect(page).to have_content(@dealership_2.cars_count)
  end

  it 'has a link to the cars index page' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_link('Cars', href: '/cars')
  end

  it 'has a link to the dealerships index page' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_link('Dealerships', href: '/dealerships')
  end

  it 'has a link to the cars by dealership selected page' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_link('Associated Cars', href: "/dealerships/#{@dealership_1.id}/cars")
  end

  it 'has a link to update dealership' do
    visit "/dealerships/#{@dealership_1.id}"

    expect(page).to have_button('Update Dealership')
  end

  it 'takes the user to the edit page when you click update dealership' do
    visit "/dealerships/#{@dealership_1.id}"

    click_button('Update Dealership')

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}/edit")
  end

  it 'can submit the edit form and redirect the user to dealership show page' do
    visit "/dealerships/#{@dealership_1.id}/edit"

    fill_in('Name', with: "Ed Voyles Chrysler")
    fill_in('Open', with: "false")
    fill_in('Max Car Capacity', with: "75")

    click_button("Submit")

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}")
    expect(page).to have_content("Ed Voyles Chrysler")
    expect(page).to have_content(@dealership_1.created_at)
    expect(page).to have_no_content(@dealership_1.updated_at)
    expect(page).to have_content("false")
    expect(page).to have_content("75")

    # expect(@dealership_1.name).to eq("Ed Voyles Chrysler")
    # expect(@dealership_1.open).to eq(false)
    # expect(@dealership_1.max_car_capacity).to eq(75)
    # expect(@dealership_1.updated_at).to not_eq(DateTime.new(2020, 3, 10, 12, 15, 30))
  end
end
