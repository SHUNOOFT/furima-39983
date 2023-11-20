class AddPurchaseToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :purchase, null: false, foreign_key: true
  end
end
