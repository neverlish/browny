class MypageController < ApplicationController
	before_action :set_all, only: [:user]
  def my
  	@user = current_user
    @posts = Post.all
    if params[:category]
      @spots = Spot.where(category: params[:category])
    else
      @spots = Spot.all
    end
  end

  def user
  	@user = User.find(params[:id])
  end

  def category
    @user = current_user
    @spots = Spot.where(user: current_user, category: params[:category])
  end

  private
  def set_all
  	@spots = Spot.where(user: @user)
  	@posts = Post.all
  end
end
