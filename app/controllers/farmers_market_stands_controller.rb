class FarmersMarketStandsController < ApplicationController
  def index
    @farmers_market_stands = FarmersMarketStand.all
  end

  def show
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end

  def show_produce_items_by_farmers_market_stand_id
    farmers_market_stand = FarmersMarketStand.find(params[:id])
    @produce_items_by_farmers_market_id = farmers_market_stand.produce_items
  end
end
