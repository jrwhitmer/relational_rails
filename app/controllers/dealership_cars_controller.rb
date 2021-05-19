class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:dealership_id])
    @cars = @dealership.cars
    if !params[:_method].nil?
      @cars= @dealership.cars.by_name
    end
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    @dealership = Dealership.find(params[:id])
    car = Car.new({
      name: params[:name],
      created_at: DateTime.now,
      updated_at: DateTime.now,
      inspected: params[:inspected],
      price: params[:price],
      dealership_id: @dealership.id
      })
      car.save
      redirect_to "/dealerships/#{@dealership.id}/cars"
  end

end
