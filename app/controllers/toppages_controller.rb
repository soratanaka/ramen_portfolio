class ToppagesController < ApplicationController
  def index
    if params[:search].nil?
      @client = ::GooglePlaces::Client.new(ENV['GOOGLE_MAP_API'])
      @places = @client.spots_by_query("ラーメン", language: 'ja', types: 'food')
      gon.places = @places
      # byebug
    else
    @client = ::GooglePlaces::Client.new(ENV['GOOGLE_MAP_API'])
    @places = @client.spots_by_query("#{params[:search]},ラーメン", language: 'ja', types: 'food')
    gon.places = @places
    #  byebug
    end
          #  byebug
  end
end
