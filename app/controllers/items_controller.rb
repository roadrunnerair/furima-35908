class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end