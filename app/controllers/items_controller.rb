class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :calculate_fee_and_profit, only: [:create, :update]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :info, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def calculate_fee_and_profit
    # items コントローラーにモデルの計算ロジックを呼び出す処理を書く
    @item.calculate_fee_and_profit if @item
  end
end
