class FarmersMarketStandsController < ApplicationController
  def index
    @farmers_market_stands = FarmersMarketStand.all
  end

  def show
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end
end
