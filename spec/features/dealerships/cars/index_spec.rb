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
end