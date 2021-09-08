class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_description, :user, :category_id, :item_condition_id, :item_postage_id, :prefecture_id, :estimated_shipping_date_id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end