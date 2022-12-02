class ShopsController < ApplicationController

  def create
    @shop = Shop.new(shop_params)
    shop = params[:shop]
    respond_to do |format|
      if @shop.save
        format.html { redirect_to controller: :posts, action: :new ,shop: {shop_id:@shop.id ,name:shop[:name], latitude:shop[:latitude], longitude:shop[:longitude]}}
      else
        format.html { render :show}
      end
    end
  end

  def index
    
  end

  def show
    @shop = Shop.new
    @name = params[:content]
    @lat = params[:lat]
    @lng = params[:lng]
    # byebug
    if Shop.find_by(name: @name, latitude: @lat, longitude: @lng)
      @shop_config = Shop.find_by(name: @name, latitude: @lat, longitude: @lng)
      if Post.find_by(shop_id:@shop_config.id)
        @posts = Post.where(shop_id:@shop_config.id)
      end
    end
    # byebug
  end


  private

  def shop_params
    params.require(:shop).permit(:name, :latitude, :longitude).merge(user_id:current_user.id)
  end
end
