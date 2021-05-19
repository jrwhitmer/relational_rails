class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update({
      name: params[:name],
      updated_at: DateTime.now,
      inspected: params[:inspected],
      price: params[:price]
      })
      car.save
      redirect_to "/cars/#{car.id}"
  end
end
