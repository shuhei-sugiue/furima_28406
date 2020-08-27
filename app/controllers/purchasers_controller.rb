class PurchasersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchaser = Purchaser.new(price: purchaser_params[:price])
    if @purchaser.valid?
      pay_item
      @purchaser.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchaser_params
    params.permit(:price, :token)
  end
  
  def pay_item
    Payjp.api_key = "sk_test_020e00e5be0dce46e205aad9"
    Payjp::Charge.create(
      amount: purchaser_params[:price],
      card: purchaser_params[:token],
      currency:'jpy'
    )
  end

end
