class PurchaseOrder < ApplicationRecord
  before_action :authenticate_user!, only: [:index]

  def index
  end

  private
  def item_params
    params.require(:purchase_order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end