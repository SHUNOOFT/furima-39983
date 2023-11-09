class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :shipping_fee_id,  null: false
      t.integer    :shipping_city_id, null: false
      t.integer    :shipping_day_id,  null: false
      t.integer    :image_id,         null: false,foreign_key:true
      t.timestamps
    end
  end
end
