class PurchasersController < ApplicationController
  before_action :correct_user, only: [:index]
  before_action :item_find, only: [:index, :create]

  def index
  end

  def create
    @purchaser = PurchaserAddress.new(purchaser_params)
    if @purchaser.valid?
      pay_item
      @purchaser.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def correct_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path unless @item.purchaser.nil?
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def purchaser_params
    params.permit(:token, :zip_code, :province, :municipal, :street_number, :building, :telephone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end
end
