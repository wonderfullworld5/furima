class RecordsController < ApplicationController
  before_action :set_item, only: [:index]

  def index
    @order = Order.new
    @purchase_form = PurchaseForm.new
  end

  def create
    binding.pry
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:item_id, :user_id)
  end

  def purchase_form_params
    params.require(:purchase_form).permit(:postcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
