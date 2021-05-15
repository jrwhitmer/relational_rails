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

  xit 'can view the sorted names of each dealership in the system' do
    visit '/dealerships'

    expect(page.find('p:nth-child(1)')).to have_content(@dealership_1.name)
    expect(page.find('p:nth-child(2)')).to have_content(@dealership_2.name)
  end

  it 'has a link to the cars index page' do
    visit '/cars'

    expect(page).to have_link('Cars', href: '/cars')
  end
end
