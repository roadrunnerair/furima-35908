require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,name,price,item_description,user,category_id,item_condition_id,item_postage_id,prefecture_id,estimated_shipping_date_idがあれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが300円なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが9,999,999円なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end

      it 'priceが半角なら出品できる' do
        @item.price = 300
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
        expect(@item.errors.full_messages).to include("Item_description can't be blank")
      end

      it 'userがないと出品できない' do
        @item.user = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it 'category_idがないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'item_condition_idがないと出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item_condition_id must be other than 1')
      end

      it 'item_postage_idがないと出品できない' do
        @item.item_postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item_postage_id must be other than 1')
      end

      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'estimated_shipping_date_idがないと出品できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated_shipping_date_id must be other than 1')
      end

      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
