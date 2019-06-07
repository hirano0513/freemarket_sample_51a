class ItemsController < ApplicationController
  def index
    @items = Item.all.order("id DESC").limit(4)
  end

  def new
    @item = Item.new
    @shipment = Shipment.new
  end

  def create
    @item = Item.create(item_params)
    @shipment = Shipment.create(shipment_params)
    redirect_to root_path

  end

  private
  def item_params
    params.require(:item).permit(:name, :size, :price, :item_status)
  end

  def shipment_params
    params.require(:shipment).permit(:cost_payer, :method, :days, :prefecture_id)
  end

end
