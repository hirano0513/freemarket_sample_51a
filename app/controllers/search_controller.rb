class SearchController < ApplicationController
  def index
    @item = Item.where('name LIKE(?)', "%#{params[:search]}%")
    @search_word = params[:search]
  end
end
