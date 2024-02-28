class FurimaController < ApplicationController
  def index
    @furimas = Furima.all || [] # Furimaモデルからデータを取得し、nilの場合は空の配列を代入する
  end
end
