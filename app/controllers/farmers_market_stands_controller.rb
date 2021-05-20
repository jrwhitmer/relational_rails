class FarmersMarketStandsController < ApplicationController

  def index
    @farmers_market_stands = FarmersMarketStand.all.order('created_at')
  end

  def show
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end

  def new
  end

  def create
    farmers_market_stand = FarmersMarketStand.create(farmers_market_stand_params)
    redirect_to "/farmers_market_stands"
  end

  def edit
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end

  def update
    farmers_market_stand = FarmersMarketStand.find(params[:id])
    farmers_market_stand.update(farmers_market_stand_params)
    redirect_to "/farmers_market_stands/#{farmers_market_stand.id}"
  end

  def farmers_market_stand_params
    params.permit(:name)
  end
end
