class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top, only: [:edit, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
    #sold_out?
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :info, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  #def sold_out?
    #@item.price < 0
  #end
end