class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :info,            null: false
      t.integer    :tag_id,          null: false
      t.integer    :condition_id,    null: false
      t.integer    :prefecture_id,   null: false
      t.integer    :invoice_city_id, null: false
      t.integer    :invoice_day_id,  null: false
      t.integer    :price,           null: false
      t.references :user,            null: false,foreign_key:true
      t.timestamps
    end
  end
end
