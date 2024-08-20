class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_message, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buyaddress = BuyAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
    if current_user != @item.user && @item.buy.present?
      redirect_to root_path
    end
  end

  def create
    @buyaddress = BuyAddress.new(buy_params)
    if @buyaddress.valid?
      pay_item
      @buyaddress.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :'index', status: :unprocessable_entity
    end
  end

  private

  def find_message
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :other, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

