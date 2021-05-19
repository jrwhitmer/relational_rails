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

  def farmers_market_stand_params
    params.permit(:name)
  end
end
