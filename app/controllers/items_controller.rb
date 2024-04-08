class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def edit
    # 編集ページの表示はビューで実装するため、特に何も記述しない
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'Item created!'
      redirect_to @item
    else
      render 'new'
    end
  end
end

  private

# def set_item
# @item = Item.find(params[:id])
# end

def item_params
  params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id,
                               :delivery_date_id, :price)
end

# date_idの存在を確認
def check_date_id_presence
  return if params.dig(:item, :delivery_date_id).present?

  flash.now[:alert] = '発送までの日数を選択してください。'
end
