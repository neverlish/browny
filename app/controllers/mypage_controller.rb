class MypageController < ApplicationController
	before_action :set_all
  def my
  	@user = current_user
  end

  def user
  	@user = User.find(params[:id])
  end

  private
  def set_all
  	@spots = Spot.all
  	@posts = Post.all
  end
end
