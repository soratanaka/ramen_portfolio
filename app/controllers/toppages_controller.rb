class ToppagesController < ApplicationController
  
  def index
    @posts = Post.order('id DESC').limit(20)
    if params[:search].nil?
      @client = ::GooglePlaces::Client.new(ENV['GOOGLE_MAP_API'])
      @places = @client.spots_by_query("ラーメン", language: 'ja', types: 'food')
      gon.places = @places
    else
      @client = ::GooglePlaces::Client.new(ENV['GOOGLE_MAP_API'])
      @places = @client.spots_by_query("#{params[:search]},ラーメン", language: 'ja', types: 'food')
      gon.places = @places
    end
  end
end
