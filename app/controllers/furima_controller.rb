class FurimaController < ApplicationController
  def index
    @tweets = furima.all
  end
end
