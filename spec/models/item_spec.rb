# spec/models/item_spec.rb

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build(:item) }

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '全ての属性が正しく設定されていれば出品できる' do
        expect(item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it '商品名が空では出品できない' do
        item.item_name = ''
        expect(item).to_not be_valid
        expect(item.errors[:item_name]).to include("can't be blank")
      end

      it '商品の説明が空では出品できない' do
        item.item_describe = ''
        expect(item).to_not be_valid
        expect(item.errors[:item_describe]).to include("can't be blank")
      end

      it 'カテゴリーIDが空では出品できない' do
        item.category_id = 1
        expect(item).to_not be_valid
        expect(item.errors[:category_id]).to include("can't be blank")
      end

      it '商品状態IDが空では出品できない' do
        item.condition_id = 1
        expect(item).to_not be_valid
        expect(item.errors[:condition_id]).to include("can't be blank")
      end

      it '配送料の負担IDが空では出品できない' do
        item.delivery_charge_id = 1
        expect(item).to_not be_valid
        expect(item.errors[:delivery_charge_id]).to include("can't be blank")
      end

      it '発送元の地域IDが空では出品できない' do
        item.delivery_region_id = 1
        expect(item).to_not be_valid
        expect(item.errors[:delivery_region_id]).to include("can't be blank")
      end

      it '発送までの日数IDが空では出品できない' do
        item.delivery_day_id = 1
        expect(item).to_not be_valid
        expect(item.errors[:delivery_day_id]).to include("can't be blank")
      end

      it '価格が空では出品できない' do
        item.price = nil
        expect(item).to_not be_valid
        expect(item.errors[:price]).to include("can't be blank")
      end

      it '価格が¥300未満では出品できない' do
        item.price = 299
        expect(item).to_not be_valid
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it '価格が¥9,999,999を超えると出品できない' do
        item.price = 10_000_000
        expect(item).to_not be_valid
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it '価格は半角数字で入力しなければ出品できない' do
        item.price = '３００'
        expect(item).to_not be_valid
        expect(item.errors[:price]).to include("is not a number")
      end

      it '画像が添付されていなければ出品できない' do
        item.image = nil
        expect(item).to_not be_valid
        expect(item.errors[:image]).to include("can't be blank")
      end

      it 'ユーザーが紐づいていないと保存できない' do
        item.user = nil
        expect(item).to_not be_valid
        expect(item.errors[:user]).to include("must exist")
      end
    end
  end
end
