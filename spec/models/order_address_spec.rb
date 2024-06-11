require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    # speed 3
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end

      it 'address_secondは空でも購入できること' do
        @order_address.address_second = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'post_codeが空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角の-を含んだ正しい形式でないと購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'delivery_region_idを選択していないと購入できない' do
        @order_address.delivery_region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery region can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_firstが空だと購入できない' do
        @order_address.address_first = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address first can't be blank")
      end

      it 'phoneが空だと購入できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが9桁以下だと購入できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')
      end

      it 'phoneが12桁以上だと購入できない' do
        @order_address.phone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')
      end

      it 'phoneに半角数字以外が含まれている場合は購入できない' do
        @order_address.phone = '09012345678a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')
      end

      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品が紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
