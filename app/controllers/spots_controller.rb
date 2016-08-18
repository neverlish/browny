class SpotsController < ApplicationController
  before_action :authenticate_user!, except: []
  def index
  	@spots = Spot.all
  end

  def new
  	@spot = Spot.new
  end

  def show
  	@spot = Spot.find(params[:id])
    if !SpotRead.find_by(user: current_user, spot_id: params[:id])
      if current_user.posts.count * 5 >= current_user.read_spots.count
        SpotRead.create(user: current_user, spot_id: params[:id])
      else        
        redirect_to spots_path
      end
    end
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spots_path
    else
      render 'new'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to @spot
    else
      render 'edit'
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  private
  def spot_params
	params.require(:spot).permit(:name, :category)
  end
end