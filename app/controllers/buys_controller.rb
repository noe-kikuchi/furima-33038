class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:buy).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
