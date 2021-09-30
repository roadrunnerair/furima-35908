class OrdersController < ApplicationController

  def index
    @mailing_address_order_history = MailingAddressOrderHistory.new
  end

  def create
    @mailing_address_order_history = MailingAddressOrderHistory.new(order_history_params)
    if @mailing_address_order_history.valid?
      @mailing_address_order_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_history_params
    item = Item.find(params[:item_id])
    params.require(:mailing_address_order_history).permit(:postal_code, :prefecture_id,:city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end
end