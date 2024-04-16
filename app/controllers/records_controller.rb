class RecordsController < ApplicationController
  before_action :set_item, only: [:index, :new_order]

  def index
    @purchase_form = PurchaseForm.new
    render 'records/index'
  end

  def new_order
  end

  def create
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

  def purchase_form_params
    params.require(:purchase_form).permit(:postcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
