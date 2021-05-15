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
end
