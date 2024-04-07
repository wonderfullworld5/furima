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
    puts current_user
    @item = current_user.items.build(item_params) 

    # アップロードされた画像があるかどうかを確認する
    if params[:item][:image].present?
      # アップロードされた画像をActive Storageを使用して保存する
      @item.image.attach(params[:item][:image])

    end

    if @item.save

      redirect_to root_path
    else
      Rails.logger.error @item.errors.full_messages.join(", ")
      render :new
    end
  end
  
  private

  #def set_item
    #@item = Item.find(params[:id])
  #end

  def item_params
    params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id, :delivery_date_id, :price)
  end

  # date_idの存在を確認
  def check_date_id_presence
    unless params.dig(:item, :delivery_date_id).present?
      flash.now[:alert] = "発送までの日数を選択してください。"
    end
  end
end
