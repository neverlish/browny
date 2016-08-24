class PlacesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :city_select, only: [:new, :create]

  def index
    @places = Place.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
    marker.lat place.latitude
    marker.lng place.longitude
    end
    
  end

  def new
  	@place = Place.new
  end

  def create
   	@place = Place.new(place_params)
    @place.save ? (redirect_to @place) : (render 'new')
  end

  def show
    @spots = @place.spots.all
    @list = Array.new
    @spots.each {|spot| @list << spot}
    @list << @place
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
    marker.lat spot.latitude
    marker.lng spot.longitude
    marker.title   "i'm the title"
    marker.infowindow render_to_string(
      :partial => "/spots/info", 
      :locals => {spot: spot})
    end
  end

  def edit
  end

  def update
  	@place.update(place_params) ? (redirect_to @place) : (render 'edit')
  end

  def destroy
  	@place.destroy
  	redirect_to places_path
  end

  private
  def place_params
   	params.require(:place).permit(:name, :latitude, :longitude, :city_id, :address, :picture, :picture_cache)
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def city_select
    @city_id = params[:city_id]
  end
end
