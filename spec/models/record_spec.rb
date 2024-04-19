require 'rails_helper'

RSpec.describe '商品購入', type: :request do
  describe 'GET /items/:id/purchase' do
    context 'ログインしている場合' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        sign_in @user
      end

      it '正常' do
        get purchase_item_path(@item)
        expect(response).to have_http_status(:ok)
      end

      it '自分の商品を購入しようとした場合、ホームページにリダイレクトすること' do
        own_item = FactoryBot.create(:item, user: @user)
        get purchase_item_path(own_item)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインしていない場合' do
      it 'サインインページにリダイレクトすること' do
        item = FactoryBot.create(:item)
        get purchase_item_path(item)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /items/:id/purchase' do
    context '有効なパラメータ' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        sign_in @user
      end

      it '購入を完了' do
        expect {
          post purchase_item_path(@item), params: { purchase_form: { postcode: '123-4567', phone: '09012345678', city: 'City', street: 'Street' } }
        }.to change(Record, :count).by(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context '異常' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        sign_in @user
      end

      it '購入できない' do
        expect {
          post purchase_item_path(@item), params: { purchase_form: { postcode: '', phone: '', city: '', street: '' } }
        }.not_to change(Record, :count)
        expect(response).to render_template(:index)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
