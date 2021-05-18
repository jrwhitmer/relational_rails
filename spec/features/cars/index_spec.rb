require 'rails_helper'

RSpec.describe 'cars index page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)
    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)
    @car_1 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Fusion", created_at: DateTime.new(2015, 6, 22, 9, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 15999.99)
    @car_2 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M3", created_at: DateTime.new(2005, 7, 24, 10, 05, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 12999.99)
  end

  it 'can view the name of each car in the system' do
    visit '/cars'

    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_2.name)
  end

  it 'has a link to the cars index page' do
    visit '/cars'

    expect(page).to have_link('Cars', href: '/cars')
  end

  it 'has a link to the dealerships index page' do
    visit '/cars'

    expect(page).to have_link('Dealerships', href: '/dealerships')
  end
end
