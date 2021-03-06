class CitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
  	@cities = City.all
  end

  def new
  	@city = City.new
  end

  def create
  	@city = City.new(city_params)
  	@city.save ? (redirect_to @city) : (render 'new')
  end

  def show
    @places = @city.places.all
    @list = Array.new
    @places.each {|place| @list << place}
    @list << @city
    @hash = Gmaps4rails.build_markers(@list) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  def edit
  end

  def update
  	@city.update(city_params) ? (redirect_to @city) : (render 'edit')
  end

  def destroy
  	@city.destroy
  	redirect_to cities_path
  end

  private
  def city_params
  	params.require(:city).permit(:name, :latitude, :longitude, :address,:picture)
  end

  def set_city
  	@city = City.find(params[:id])
  end
end
