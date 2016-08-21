class LikesController < ApplicationController
	before_action :authenticate_user!

	def like_toggle
		@like = Like.find_by(user_id: current_user.id,spot_id: params[:spot_id])
		if @like.nil?
			Like.create(user_id: current_user.id,spot_id: params[:spot_id])
		else
			@like.destroy
		end
		redirect_to :back
	end
end