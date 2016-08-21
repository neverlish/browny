class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spot, only: [:show, :edit, :update, :destroy, ]
  before_action :spot_select, only: [:index, :category]

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
    @spot.save ? (redirect_to spots_path) : (render 'new')
  end

  def show
    @spotlike = Like.where(spot_id: @spot.id, post_id: nil)
    @post = Post.new
    # if !SpotRead.find_by(user: current_user, spot_id: params[:id])
    #   if current_user.posts.count * 5 >= current_user.read_spots.count
    #     SpotRead.create(user: current_user, spot_id: params[:id])
    #   else        
    #     redirect_to spots_path
    #   end
    # end
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
	  params.require(:spot).permit(:name, :place_id, :category, :picture)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_select
    @place_id = params[:place_id]
    @spot_categories = Spot.categories.keys
    @places = Place.all
  end
end