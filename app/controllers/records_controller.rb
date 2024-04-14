class RecordsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record).permit(:item_id).merge(user_id: current_user.id)
  end
end
