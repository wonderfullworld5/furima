class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])  # 購入する商品情報を取得
    @record_form = PurchaseForm.new  # Formオブジェクトのインスタンスを作成
  end

  def create
    @item = Item.find(params[:item_id])
    @record_form = PurchaseForm.new(record_params)
    if @record_form.save
      redirect_to root_path  # 購入後はトップページへリダイレクト
    else
      render :index  # エラーがあれば購入ページを再表示
    end
  end

  private

  def record_params
    params.require(:purchase_form).permit(:postcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
