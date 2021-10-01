require 'rails_helper'

RSpec.describe MailingAddressOrderHistory, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @mailing_address_order_history= FactoryBot.build(:mailing_address_order_history, user_id: @user.id, item_id: @item.id)
    sleep (1)
  end

  describe '購入できるとき' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@mailing_address_order_history).to be_valid
      end
      
      it "建物名が空の場合でも保存できること" do
        @mailing_address_order_history.building_name = ''
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'postal_code が空では登録できないこと' do
        @mailing_address_order_history.postal_code = ''
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @mailing_address_order_history.postal_code = '123ー4567'
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが 0 では保存できないこと' do
        @mailing_address_order_history.prefecture_id = 0
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city が空では保存できないこと' do
        @mailing_address_order_history.city = ''
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("City can't be blank")
      end

      it 'house_number が空では保存できないこと' do
        @mailing_address_order_history.house_number = ''
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_number が空では保存できないこと' do
        @mailing_address_order_history.phone_number = ''
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number が英数混合では保存できないこと' do
        @mailing_address_order_history.phone_number = '００００００００aaa'
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Phone number is not a number")
      end

      it 'phone_number が11桁以内の数値のみでなければ保存できないこと' do
        @mailing_address_order_history.phone_number = '０００００００００００'
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Phone number is not a number")
      end

      it "user_id が空では登録できないこと" do
        @mailing_address_order_history.user_id = nil
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("User can't be blank")
      end
      
      it "item_id が空では登録できないこと" do
        @mailing_address_order_history.item_id = nil
        @mailing_address_order_history.valid?
        expect(@mailing_address_order_history.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end