class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    params.require(:item).permit(:image, :title, :info, :tag_id, :condition_id, :prefecture_id, :invoice_city_id, :invoice_day_id, ).merge(user_id: current_user.id)
  end
end
