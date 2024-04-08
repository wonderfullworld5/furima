require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '機能の検証' do
    context '有効な場合' do
      it '有効な属性の場合、有効' do
        expect(@item).to be_valid
      end
    end

    context '無効な場合' do
      it 'カテゴリがない場合、無効' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it '商品の状態がない場合、無効' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it '送料負担についての情報がない場合、無効' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors[:postage_id]).to include("can't be blank")
      end

      it '発送元の地域についての情報がない場合、無効' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors[:area_id]).to include("can't be blank")
      end

      it '発送までの日数についての情報がない場合、無効' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors[:delivery_date_id]).to include("can't be blank")
      end

      it '価格についての情報がない場合、無効' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格が300より小さい場合、無効' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格が9999999より大きい場合、無効' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '画像が添付されていない場合、無効' do
        @item.image.detach
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'ユーザーが関連付けられていない場合、無効' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end
    end
  end
end