class ItemsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    # カテゴリー新着1
    @picup_category_items1 = Category.find(1).items.order("created_at DESC").limit(4)

    # カテゴリー新着2
    @picup_category2 = Category.find(2).items.order("created_at DESC").limit(4)

    # カテゴリー新着3
    @picup_category3 = Category.find(3).items.order("created_at DESC").limit(4)

    # カテゴリー新着4
    @picup_category4 = Category.find(4).items.order("created_at DESC").limit(4)

    # # ブランド新着1
    # @picup_brand1 = Brand.find(1).items.order("created_at DESC").limit(4)

    # # ブランド新着2
    # @picup_brand2 = Brand.find(2).items.order("created_at DESC").limit(4)

    # # ブランド新着3
    # @picup_brand3 = Brand.find(3).items.order("created_at DESC").limit(4)

    # # ブランド新着4
    # @picup_brand4 = Brand.find(4).items.order("created_at DESC").limit(4)
    # @brand4 = @picup_brand4[0].brand  if (@picup_brand4.length != 0)

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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :size, :description, :price, :item_status, shipment_attributes: [:id, :cost_payer, :method, :days, :prefecture_id],images: [], brand_attributes: [:id, :name], items_categories_attributes: [:id,:category_id]).merge(seller_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end
