class FurimaController < ApplicationController
  def index
    @furimas = Furima.all
  end
end
