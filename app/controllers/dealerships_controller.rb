class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end
  def show
    @dealership = Dealership.find(params[:id])
  end
  def show_cars_by_dealership_id
    dealership = Dealership.find(params[:id])
    @cars_by_dealership_id = dealership.cars 
  end
end
