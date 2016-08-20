class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  
  def index
  	@spots = Spot.all
  end

  def new
  	@spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save ? (redirect_to spots_path) : (render 'new')
  end

  def show
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
	  params.require(:spot).permit(:name, :category, :place_id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end