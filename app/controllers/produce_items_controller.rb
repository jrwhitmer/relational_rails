class ProduceItemsController < ApplicationController
  def index
    @produce_items = ProduceItem.all
  end

  def show
    @produce_item = ProduceItem.find(params[:id])
  end

  def edit
    @produce_item = ProduceItem.find(params[:id])
  end

  def update
    produce_item = ProduceItem.find(params[:id])
    produce_item.update({
      type: params[:type],
      weight: params[:weight],
      price_by_weight: params[:price_by_weight],
      organic: params[:organic]
      })
      produce_item.save
      redirect_to "/produce_items/#{produce_item.id}"
  end
end
