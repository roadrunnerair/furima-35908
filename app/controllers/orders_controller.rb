class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @mailing_address_order_history = MailingAddressOrderHistory.new
  end

  def create
    @mailing_address_order_history = MailingAddressOrderHistory.new(order_history_params)
    if @mailing_address_order_history.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_history_params[:token],
        currency: 'jpy'
      )
      @mailing_address_order_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_history_params
    params.require(:mailing_address_order_history).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.order_history.nil?
  end
end
