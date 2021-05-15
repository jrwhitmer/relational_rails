class ProduceItemsController < ApplicationController
  def index
    @produce_items = ProduceItem.all
  end

  def show
    @produce_item = ProduceItem.find(params[:id])
  end
end
