require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入機能' do
    before do
      @purchase_order = FactoryBot.build(:purchase_order)
    end

    it '購入が可能であること' do
      expect(@purchase_order).to be_valid
    end

    context '購入ができない場合' do
      it '郵便番号が未入力の場合、購入できないこと' do
        @purchase_order.postcode = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postcode can't be blank")
      end

      it '都道府県が未選択の場合、購入できないこと' do
        purchase_order = PurchaseOrder.new(prefecture_id: '')
        purchase_order.valid?
        expect(purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が未入力の場合、購入できないこと' do
        @purchase_order.city = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が未入力の場合、購入できないこと' do
        @purchase_order.block = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が未入力の場合、購入できないこと' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end