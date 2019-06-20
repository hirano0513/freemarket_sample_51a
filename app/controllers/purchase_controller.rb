class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_item, only: %i[pay done]

  def index
    card = current_user.credit_card
    if card.present?
      Payjp.api_key =ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end

    @item = Item.find(params[:item_id])
  end

  def pay
    card = current_user.credit_card
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    if @item.update!(buyer_id: current_user.id)
      redirect_to root_path
      flash[:notice] = "購入が完了しました。"
    else
      flash[:notice] = "エラーが発生しました。"
      redirect_to root_parh
    end
  end

  def done
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
