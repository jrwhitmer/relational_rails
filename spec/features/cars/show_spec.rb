require 'rails_helper'

RSpec.describe 'cars show page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)
    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)
    @car_1 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Fusion", created_at: DateTime.new(2015, 6, 22, 9, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 15999.99)
    @car_2 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M3", created_at: DateTime.new(2005, 7, 24, 10, 05, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 12999.99)
  end

  it 'can display cars and their attributes on id page' do
    visit "/cars/#{@car_1.id}"

    expect(page).to have_content(@car_1.dealership_id)
    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_1.created_at)
    expect(page).to have_content(@car_1.updated_at)
    expect(page).to have_content(@car_1.inspected)
    expect(page).to have_content(@car_1.price)

    visit "/cars/#{@car_2.id}"

    expect(page).to have_content(@car_2.dealership_id)
    expect(page).to have_content(@car_2.name)
    expect(page).to have_content(@car_2.created_at)
    expect(page).to have_content(@car_2.updated_at)
    expect(page).to have_content(@car_2.inspected)
    expect(page).to have_content(@car_2.price)
  end

  it 'has a link to the cars index page' do
    visit "/cars/#{@car_2.id}"

    expect(page).to have_link('Cars', href: '/cars')
  end

  it 'has a link to the dealerships index page' do
    visit "/cars/#{@car_1.id}"

    expect(page).to have_link('Dealerships', href: '/dealerships')
  end

  it 'has a link to update car' do
    visit "/cars/#{@car_1.id}"

    expect(page).to have_button('Update Car')
  end

  it 'can take the user to the edit page when update button is clicked' do
    visit "/cars/#{@car_1.id}"

    click_button('Update Car')

    expect(current_path).to eq("/cars/#{@car_1.id}/edit")
  end

  it 'can submit the edit form and take the user to cars show page' do
    visit "/cars/#{@car_1.id}/edit"

    fill_in('Name', with: 'Honda Civic')
    fill_in('Inspected', with: 'false')
    fill_in('Price', with: '12900')
    click_button('Update Car')

    expect(current_path).to eq("/cars/#{@car_1.id}")
    expect(page).to have_content('Honda Civic')
  end
end
