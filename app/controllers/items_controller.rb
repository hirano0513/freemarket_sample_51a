class ItemsController < ApplicationController
  
  def index
    # カテゴリー新着1
    @picup_category1 = Category.find(1).items.order("created_at ASC").limit(4)
    @category1 = @picup_category1[0].categories[0]

    # ブランド新着1
    @picup_brand1 = Brand.find(1).items.order("created_at ASC").limit(4)
    @brand1 = @picup_brand1[0].brand

    # 全アイテムからデータ取り出し(仮)
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

end
