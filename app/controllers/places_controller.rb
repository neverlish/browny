class PlacesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
  	@places = Place.all
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
    @place.save ? (redirect_to @place) : (render 'new')
  end

  def show
    @places = Place.all
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
   	params.require(:place).permit(:name, :latitude, :longitude, :city_id, :address)
  end

  def set_place
    	@place = Place.find(params[:id])
  end
end
