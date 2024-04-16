class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    # 注文の詳細を表示する
    @order = Order.new
  end

  def create
    binding.pry
    # フォームから受け取ったデータで注文を作成
    @order = Order.new(order_params)
    if @order.save
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
    params.require(:order).permit(:item_id, :user_id)  # 必要なパラメータを設定
  end
end

