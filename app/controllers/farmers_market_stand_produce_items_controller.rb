class FarmersMarketStandProduceItemsController < ApplicationController
  def index
    @farmers_market_stand = FarmersMarketStand.find(params[:farmers_market_stand_id])
    @produce_items = @farmers_market_stand.produce_items
  end
end
