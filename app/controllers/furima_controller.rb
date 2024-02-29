class FurimaController < ApplicationController
  def index
<<<<<<< HEAD
    @tweets = furima.all
=======
    @furimas = Furima.all
    @furimas ||= [] # @furimasがnilの場合、空の配列を代入する
>>>>>>> parent of 3b9fb57 (ユーザー認証)
  end
end
