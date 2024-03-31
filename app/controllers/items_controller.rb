class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    if user_signed_in?
      @item = current_user.items.build
    else
      redirect_to new_user_session_path, alert: "ログインしてください。"
    end
  end

  def edit
    # 編集ページの表示はビューで実装するため、特に何も記述しない
  end

  def show
    if params[:id] == "new_user"
      redirect_to new_user_path
    else
      @item = Item.find(params[:id])
    end
  end

  def create
    @item = current_user.items.build(item_params)
    check_date_id_presence  # 日付の存在を確認するメソッドを呼び出す

    if @item.save
      redirect_to root_path, notice: "商品が正常に出品されました。"
    else
      flash.now[:alert] = "商品の出品に失敗しました。入力内容を確認してください。"
      # デバッグ用にフォームの送信内容を出力
      Rails.logger.debug "フォームの送信内容: #{params.inspect}"
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id, :date_id, :price)
  end

  # date_idの存在を確認
  def check_date_id_presence
    unless params.dig(:item, :date_id).present?
      flash.now[:alert] = "発送までの日数を選択してください。"
    end
  end
end

