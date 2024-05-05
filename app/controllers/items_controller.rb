class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_date_id_presence, only: [:create, :update]
  before_action :check_user_and_sold_status, only: [:edit, :update, :show]

  def new
    @item = Item.new
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, :price)
  end

  def check_user_and_sold_status
    if @item.sold_out? && current_user.id == @item.user_id
      redirect_to root_path
return
    end
  end
  

  def check_date_id_presence
    return if params.dig(:item, :delivery_date_id).present?
  end
end
