class ItemsController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    # カテゴリー新着1
    @picup_category_items1 = Category.find(1).items.order("created_at DESC").limit(4)

    # カテゴリー新着2
    @picup_category_items2 = Category.find(2).items.order("created_at DESC").limit(4)

    # カテゴリー新着3
    @picup_category_items3 = Category.find(3).items.order("created_at DESC").limit(4)

    # カテゴリー新着4
    @picup_category_items4 = Category.find(4).items.order("created_at DESC").limit(4)

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
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      shipment_id = Shipment.find(@item.id).id
      if shipment_id.present?
        item = Item.find(@item.id)
        item.update(shipment_id: shipment_id)
      else
        redirect_to new_item_path
      end
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
  end

  def destroy    
    @item.destroy
    redirect_to root_path, notice: '商品を削除しました'
  end

  def edit
    @parents = Category.all.order("id ASC").limit(13)
    @children = @item.categories[0].children
    @grand_children = @item.categories[1].children
  end

  def update
    if @item.seller_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path
      else
        redirect_to edit_item_path
      end
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        else
          @grand_children = Category.find(params[:child_id]).children
        end
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :size, :description, :price, :item_status, shipment_attributes: [:id, :cost_payer, :method, :days, :prefecture_id],images: [], brand_attributes: [:id, :name], :category_ids => []).merge(seller_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
