class UsersController < ApplicationController
  def show
    # ログインユーザー自身の情報を取得する
    @user = current_user
  end
end


