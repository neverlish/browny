class MypageController < ApplicationController
  def my
  	@user = current_user
  end

  def user
  	@user = User.find(params[:id])
  end
end
