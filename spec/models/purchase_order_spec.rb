require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe 'バリデーション' do
    context '正常系' do
      before do
        @user = FactoryBot.create(:user) # 必要なユーザーを作成
        @item = FactoryBot.create(:item) # 必要な商品を作成
        @purchase_order = FactoryBot.build(:purchase_order, user_id: @user.id, item_id: @item.id)
      end

      it '全ての項目が正しく入力されていればバリデーションが通ること' do
        expect(@purchase_order).to be_valid
      end

      it '建物名の入力がなくてもバリデーションが通ること' do
        @purchase_order.building = nil
        expect(@purchase_order).to be_valid
      end
    end

    context '異常系' do
      before do
        @purchase_order = FactoryBot.build(:purchase_order)
      end

      it '郵便番号が未入力の場合、購入できないこと' do
        @purchase_order.postcode = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号がハイフンなしの場合、購入できないこと' do
        @purchase_order.postcode = '1234567' # ハイフンなしの場合
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it '都道府県が未選択の場合、購入できないこと' do
        @purchase_order.prefecture_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県に「---」が選択された場合、購入できないこと' do
        @purchase_order.prefecture_id = 0
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
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

      it '電話番号が9桁以下の場合、購入できないこと' do
        @purchase_order.phone_number = '123456789'  # 9桁の例
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end

      it '電話番号が12桁以上の場合、購入できないこと' do
        @purchase_order.phone_number = '123456789012'  # 12桁の例
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end

      it '電話番号に英数字以外が含まれている場合、購入できないこと' do
        @purchase_order.phone_number = '123-4567-8901' # ハイフンを含む場合
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is not a number")
      end

      it "tokenが空では登録できないこと" do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空の場合、購入できないこと' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の場合、購入できないこと' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end