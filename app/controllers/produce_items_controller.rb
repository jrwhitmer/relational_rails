class ProduceItemsController < ApplicationController
  def index
    @produce_items = ProduceItem.all
  end
end
