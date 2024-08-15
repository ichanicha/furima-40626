class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buyaddress = BuyAddress.new
  end

  def create
    @buyaddress = BuyAddress.new(buy_params)
    if @buyaddress.valid?
       @buyaddress.save
       redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buyaddress).permit(:postal_code, :prefecture, :city, :house_number, :tel).merge(user_id: current_user.id)
  end


end

