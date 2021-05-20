class FarmersMarketStandProduceItemsController < ApplicationController
  def index
    @farmers_market_stand = FarmersMarketStand.find(params[:farmers_market_stand_id])
    @produce_items = @farmers_market_stand.produce_items
  end

  def new
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
  end

  def create
    @farmers_market_stand = FarmersMarketStand.find(params[:id])
    produce_item = ProduceItem.new(produce_items_params)
    redirect_to "/farmers_market_stands/#{@farmers_market_stand.id}/produce_items"
  end

  def produce_items_params
    params.permit(:type)
    params.permit(:weight)
    params.permit(:price_by_weight)
    params.permit(:organic)
  end
end
