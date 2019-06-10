class ItemsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @items = Item.all.order("id DESC").limit(4)
  end

  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
    @item.build_shipment
    @item.build_brand
    @item.items_categories.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :size, :description, :price, :item_status, shipment_attributes: [:id, :cost_payer, :method, :days, :prefecture_id],images: [], brand_attributes: [:id, :name], items_categories_attributes: [:id,:category_id]).merge(seller_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end
