class ItemsController < ApplicationController
  
  def index
  end

  def new
  end

  def show
    @category = Category.find(params[:id])
    @item = Item.find(params[:id])
    @shipment = Shipment.find_by(item_id: params[:id])
  end

end
