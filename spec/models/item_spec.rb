require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it '商品出品が可能であること' do
      expect(@item).to be_valid
    end

    it '画像がない場合、出品されないこと' do
      @item.image = nil
      expect(@item).not_to be_valid
    end

    it 'タイトルがない場合、出品されないこと' do
      @item.title = nil
      expect(@item).not_to be_valid
    end

    # 他にも必要なテストケースを記述する
  end
end