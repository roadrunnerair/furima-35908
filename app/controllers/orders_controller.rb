class OrdersController < ApplicationController

  def index
    @mailing_address_order_history = MailingAddressOrderHistory.new
  end

  def create
    #binding.pry
    item = Item.find(params[:item_id])
    @mailing_address_order_history = MailingAddressOrderHistory.new(order_history_params)
    if @mailing_address_order_history.valid?
      Payjp.api_key = "sk_test_e655568317aec344b5482694"
      Payjp::Charge.create(
        amount: item.price,
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

end