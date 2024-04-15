class RecordsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])  # 購入する商品情報を取得
    @purchase_form = PurchaseForm.new(item_id: @item.id)
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:purchase_form).permit(:postcode, :area_id, :city, :street, :building, :phone, :item_id)
  end
end
