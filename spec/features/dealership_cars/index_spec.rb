# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe 'parent child index page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)

    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)

    @car_1 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Fusion", created_at: DateTime.new(2015, 6, 22, 9, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 15999.99)

    @car_2 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Explorer", created_at: DateTime.new(2012, 8, 12, 7, 30, 19), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 11999.99)

    @car_3 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M3", created_at: DateTime.new(2005, 7, 24, 10, 05, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 22999.99)

    @car_4 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M6", created_at: DateTime.new(2002, 3, 2, 6, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 32999.99)
  end

  it 'can show all cars and their attributes associated with dealership id' do
    visit "/dealerships/#{@dealership_1.id}/cars"

    expect(page).to have_content(@car_1.dealership_id)
    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_1.created_at)
    expect(page).to have_content(@car_1.updated_at)
    expect(page).to have_content(@car_1.inspected)
    expect(page).to have_content(@car_1.price)

    expect(page).to have_content(@car_2.dealership_id)
    expect(page).to have_content(@car_2.name)
    expect(page).to have_content(@car_2.created_at)
    expect(page).to have_content(@car_2.updated_at)
    expect(page).to have_content(@car_2.inspected)
    expect(page).to have_content(@car_2.price)

    visit "/dealerships/#{@dealership_2.id}/cars"

    expect(page).to have_content(@car_3.dealership_id)
    expect(page).to have_content(@car_3.name)
    expect(page).to have_content(@car_3.created_at)
    expect(page).to have_content(@car_3.updated_at)
    expect(page).to have_content(@car_3.inspected)
    expect(page).to have_content(@car_3.price)

    expect(page).to have_content(@car_4.dealership_id)
    expect(page).to have_content(@car_4.name)
    expect(page).to have_content(@car_4.created_at)
    expect(page).to have_content(@car_4.updated_at)
    expect(page).to have_content(@car_4.inspected)
    expect(page).to have_content(@car_4.price)
  end

  it 'has a link to the cars index page' do
    visit "/dealerships/#{@dealership_2.id}/cars"

    expect(page).to have_link('Cars', href: '/cars')
  end

  it 'has a link to the cars index page' do
    visit "/dealerships/#{@dealership_2.id}/cars"

    expect(page).to have_link('Dealerships', href: '/dealerships')
  end

  it 'has a link to create a new car associated with this dealership' do
    visit "/dealerships/#{@dealership_1.id}/cars"

    expect(page).to have_button('Create Car')
  end

  it 'can take the user to new page when create car is clicked' do
    visit "/dealerships/#{@dealership_1.id}/cars"

    click_button('Create Car')

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars/new")
  end

  it 'can submit the new car form and redirect the user to the index page' do
    visit "/dealerships/#{@dealership_1.id}/cars/new"

    fill_in('Name', with: 'Honda Civic')
    fill_in('Inspected', with: 'false')
    fill_in('Price', with: '13440')
    click_button('Create Car')

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
    expect(page).to have_content('Honda Civic')
  end

#   As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

  it 'has a link to sort the cars alphabetically and reroutes to the same page with sorted cars' do
    visit "/dealerships/#{@dealership_1.id}/cars"

    expect(page).to have_button('Sort Cars By Name')

    click_button('Sort Cars By Name')

    expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
    expect(page.body.split("<h1>").second).to have_content(@car_2.name)
    expect(page.body.split("<h1>").third).to have_content(@car_1.name)
  end

end
