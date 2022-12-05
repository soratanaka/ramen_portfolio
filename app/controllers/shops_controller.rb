class ShopsController < ApplicationController

  def create
    @shop = Shop.new(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to controller: :posts, action: :new ,shop_id:@shop.id}
      else
        format.html { render :show}
      end
      # byebug
    end
  end

  def index
    
  end

  def show
    # byebug
    if Shop.find_by(name:params[:content])
      @shop = Shop.find_by(name:params[:content])
      @name = @shop.name
      @address = @shop.address
      @place_id = @shop.place_id
      if Post.find_by(shop_id:@shop.id)
        @posts = Post.where(shop_id:@shop.id)
      end
    elsif params[:id] != "show"
      @shop = Shop.find(params[:id])
      @name = @shop.name
      @address = @shop.address
      @place_id = @shop.place_id
      if Post.find_by(shop_id:@shop.id)
        @posts = Post.where(shop_id:@shop.id)
      end
    else
      @name = params[:content]
      @lat = params[:lat]
      @lng = params[:lng]
      @address = params[:add]
      @place_id = params[:place_id]
    end
    @client = ::GooglePlaces::Client.new(ENV['GOOGLE_MAP_API'])
    @shop_config = @client.spot(@place_id , language: 'ja')
    @opening_time = @shop_config.opening_hours
    @reviews = @shop_config.reviews
    # @photos =  @shop_config.photos
    # byebug
  end


  private

  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude ,:place_id).merge(user_id:current_user.id)
  end
end
