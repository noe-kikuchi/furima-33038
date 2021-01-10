class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @buy_ship = BuyShip.new
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def new
  end

  def create
    @buy_ship = BuyShip.new(ship_params)
    if @buy_ship.valid?
      pay_item
      @buy_ship.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def ship_params
    params.require(:buy_ship).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: ship_params[:token],
      currency: 'jpy'
    )
  end
end

