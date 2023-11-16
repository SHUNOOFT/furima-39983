class PurchaseOrdersController < ApplicationController

  def index
    @items = Item.all
    @order ||= Order.new(order_params)
    @purchase ||= Purchase.new(purchase_params)
  end
  def new
    @order ||= Order.new(order_attributes)
    @purchase ||= Purchase.new(purchase_attributes)
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      @purchase_order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def purchase_params
    params.require(:purchase).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end