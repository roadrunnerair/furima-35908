require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,name,price,item_description,user,category_id,item_condition_id,
      item_postage_id,prefecture_id,estimated_shipping_date_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameがないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceがないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'item_descriptionがないと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'userがないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'category_idがないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_condition_idがないと出品できない' do
        @item.item_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it 'item_postage_idがないと出品できない' do
        @item.item_postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item postage can't be blank")
      end

      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'estimated_shipping_date_idがないと出品できない' do
        @item.estimated_shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end

      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end
    end
  end
end
