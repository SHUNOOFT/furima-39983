class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string     :postcode,      null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block,         null: false
      t.string     :building,      null: false
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
