class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user # ログインユーザー
    #raise @item.inspect # @itemの状態を確認

    if @item.save
      redirect_to root_path, notice: "商品が正常に出品されました。"
    else
      flash.now[:alert] = "商品の出品に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :description, :category_id, :condition_id, :postage_id, :area_id, :date_id, :price)
    end
  end

