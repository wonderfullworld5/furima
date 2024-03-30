class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to root_path, notice: "商品が正常に出品されました。"
    else
      flash.now[:alert] = "商品の出品に失敗しました。入力内容を確認してください。"
# デバッグ用にフォームの送信内容を出力
Rails.logger.debug "フォームの送信内容: #{params.inspect}"

    render :new
    end
  end

  #def update
  # if @item.update(item_params)
     # redirect_to @item, notice: "商品情報が更新されました。"
    #else
      #flash.now[:alert] = "商品情報の更新に失敗しました。入力内容を確認してください。"
      #render :edit
    #end
  #end

  private

  def item_params
    params.require(:item).permit(:image, :description, :detail, :category_id, :condition_id, :postage_id, :area_id, :date_id, :price)
  # date_idの存在を確認
  if params[:item][:date_id].blank?
    flash.now[:alert] = "発送までの日数を選択してください。"
    render :new
  end
end
end