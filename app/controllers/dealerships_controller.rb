class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all.order('created_at')
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new
  end

  def create
    dealership = Dealership.new({
      name: params[:name],
      created_at: DateTime.now,
      updated_at: DateTime.now,
      open: params[:open],
      max_car_capacity: params[:max_car_capacity]
      })
      dealership.save
      redirect_to '/dealerships'
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update({
      name: params[:name],
      updated_at: DateTime.now,
      open: params[:open],
      max_car_capacity: params[:max_car_capacity]
      })
      dealership.save
      redirect_to "/dealerships/#{dealership.id}"
  end
end
