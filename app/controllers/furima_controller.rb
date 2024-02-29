class FurimaController < ApplicationController
  def index
    @furimas = Furima.all
    @furimas ||= [] # @furimasがnilの場合、空の配列を代入する
  end
end
