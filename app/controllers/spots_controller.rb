class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spot, only: [:show, :edit, :update, :destroy, :map]
  before_action :place_select, only: [:index, :category, :show, :new, :create]
  before_action :place_spots, only: [:show]

  def category
    @post = Post.new
    if @place_id
      @category_spots = Spot.where(place_id: @place_id, category: params[:category])
    else
      @category_spots = Spot.where(category: params[:category])
    end
  end
  
  def index
    @spots = @place_id ? Spot.where(place_id: @place_id) : Spot.all
  end

  def new
   	@spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    @spot.save ? (redirect_to @spot) : (render 'new')
  end

  def show
    @spotlike = Like.where(spot_id: @spot.id, post_id: nil)
    @post = Post.new
    @hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
    marker.lat spot.latitude
    marker.lng spot.longitude
    marker.title   "i'm the title"
    marker.infowindow render_to_string(
      :partial => "/spots/info", 
      :locals => {spot: spot})
    end

    # if !SpotRead.find_by(user: current_user, spot_id: params[:id])
    #   if current_user.posts.count * 5 >= current_user.read_spots.count
    #     SpotRead.create(user: current_user, spot_id: params[:id])
    #   else        
    #     redirect_to spots_path
    #   end
    # end
  end

  def map
    @hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
    marker.lat spot.latitude
    marker.lng spot.longitude
    marker.title   "i'm the title"
    marker.infowindow render_to_string(
      :partial => "/spots/info", 
      :locals => {spot: spot})
    end
  end

  def all_map
    if params[:category]
      @spots = Spot.where(category: params[:category])
    else 
      @spots = Spot.all
    end
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
    @spot.update(spot_params) ? (redirect_to @spot) : (render 'edit')
  end

  def destroy
    @spot.destroy
    redirect_to spots_path
  end

  private
  def spot_params
	  params.require(:spot).permit(:name, :user, :place_id, :category, :picture, :picture_cache, :latitude, :longitude,:address)
  end

  def set_spot
    if params[:spot_id]
      @spot = Spot.find(params[:spot_id])
    else params[:id]
      @spot = Spot.find(params[:id])
    end
  end

  def place_select
    @place_id = params[:place_id]
    @spot_categories = Spot.categories.keys
    @places = Place.all
  end

  def place_spots
    if @place_id
      if params[:category]
        @spots = Spot.where(place_id: @place_id, category: params[:category])
      else
        @spots = Spot.where(place_id: @place_id)
      end
    else
      @spots = Spot.all
    end
  end
end