class FarmersMarketStandsController < ApplicationController

  def index
    @farmers_market_stands = FarmersMarketStand.all.order('created_at')
  end

  def show
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end

  def new

  end
end
