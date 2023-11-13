class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item,only: [:show, :edit, :update]

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
    @item = Item.find(params[:id])
    # ログインユーザーが出品者でない場合はトップページにリダイレクト
    unless current_user.id == @item.user_id
      redirect_to root_path, alert: "他のユーザーの商品は編集できません。"
      return
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :info, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  #def sold_out?
    #@item.price < 0
  #end
end