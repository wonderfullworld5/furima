class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_id, :area_id, :date_id, :price, :image)
  end
end