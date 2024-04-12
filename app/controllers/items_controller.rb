class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_date_id_presence, only: [:create, :update]
  before_action :check_user, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def edit
    # 商品編集ページ表示
    # set_item & check_user are called via before_action
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品が正常に更新されました。'
    else
      render :edit
    end
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, :price)
  end

  def check_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  # 発送までの日数の存在を確認
  def check_date_id_presence
    return if params.dig(:item, :delivery_date_id).present?

    flash.now[:alert] = '発送までの日数を選択してください。'
  end
end

