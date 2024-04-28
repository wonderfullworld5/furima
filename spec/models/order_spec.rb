require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_form = PurchaseForm.new(
      user_id: user.id,
      item_id: item.id,
      postcode: '123-4567',
      area_id: 1,
      city: 'Tokyo',
      street: 'Shibuya 1-1-1',
      building: 'Shibuya Tower 20F',
      phone: '09012345678'
    )
  end

  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end

      it '建物名は空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '購入情報が保存できない場合' do
      it '郵便番号が空だと保存できない' do
        @purchase_form.postcode = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号がハイフン無しでは保存できない' do
        @purchase_form.postcode = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("郵便番号はハイフンを含む7桁で入力してください")
      end

      it '都道府県が選択されていないと保存できない' do
        @purchase_form.area_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("都道府県を選択してください")
      end

      it '市区町村が空だと保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空だと保存できない' do
        @purchase_form.street = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空だと保存できない' do
        @purchase_form.phone = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号が12桁以上では保存できない' do
        @purchase_form.phone = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号は10桁または11桁の数字で入力してください")
      end
    end
  end
end
