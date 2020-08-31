class PurchasersController < ApplicationController
  before_action :correct_user, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def create 
    @item = Item.find(params[:item_id])
    @purchaser = Purchaser.new
    if @purchaser.valid?
      pay_item
      @purchaser.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  private

  def purchaser_params
    params.permit(:token)
  end
  
  def pay_item
    Payjp.api_key = "sk_test_020e00e5be0dce46e205aad9"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency:'jpy'
    )
  end

end
