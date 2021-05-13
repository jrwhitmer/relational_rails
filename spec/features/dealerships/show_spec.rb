require 'rails_helper'

RSpec.describe 'dealerships show page' do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)
    @dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)
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
end
