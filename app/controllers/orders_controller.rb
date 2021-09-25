class OrdersController < ApplicationController

  def index
    @mailing_address_order_history = MailingAddressOderHistory.new
  end
  
end