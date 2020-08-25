class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit,:update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :state_id, :charge_id, :shipper_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
