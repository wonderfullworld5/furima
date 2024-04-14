class RecordsController < ApplicationController
  before_action :set_item, only: [:index, :create] # set_item メソッドをindexとcreateアクションで実行

  def index
    @record_form = PurchaseForm.new
    # その他必要なインスタンス変数をここでセット
  end

  def create
    @record_form = PurchaseForm.new(record_params)
    if @record_form.valid?
      process_payment # 支払処理のメソッドをここで呼び出し（仮実装）
      @record_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:purchase_form).permit(:postcode, :area_id, :city, :street, :building, :phone, :credit_card_info).merge(user_id: current_user.id, item_id: @item.id)
  end

  def process_payment
    # ここでPAY.JPなどの支払い処理を実装
  end
end

