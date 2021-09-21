class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @item = Item.all.order(created_at: :DESC)
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :item_description, :category_id, :item_condition_id, :item_postage_id,
                                 :prefecture_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end