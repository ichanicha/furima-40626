class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_message, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless @item.user == current_user
      redirect_to root_path
    end
    if current_user == @item.user && @item.buy.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user != current_user ||  @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def find_message
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shopping_charge_id, :prefecture_id, :daily_id, :price).merge(user_id: current_user.id)
  end

end
