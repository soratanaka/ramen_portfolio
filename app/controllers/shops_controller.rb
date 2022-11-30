class ShopsController < ApplicationController
  def index
    
  end

  def show
    @shop = params[:content]
  end
end
