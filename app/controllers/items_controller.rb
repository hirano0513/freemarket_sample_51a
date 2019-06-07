class ItemsController < ApplicationController
  def index
    @items = Item.all.order("id DESC").limit(4)
  end

  def new
    @item = Item.new
    @item.build_shipment
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:name, :size, :price, :item_status, shipment_attributes: [:id, :cost_payer, :method, :days, :prefecture_id], brand_attributes: [:id, :name])
  end

end
