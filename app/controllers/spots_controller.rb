class SpotsController < ApplicationController
  def index
  	@spots = Spot.all
  end

  def new
  	@spot = Spot.new
  end

  def create
  	@spot = Spot.new(spot_params)
  	
  	if @spot.save
  		redirect_to @spot
  	else
  		render 'new'
  	end
  end

  def show
  	@spot = Spot.find(params[:id])
  end

  private
  def spot_params
  	params.require(:spot).permit(:name, :category)
  end
end