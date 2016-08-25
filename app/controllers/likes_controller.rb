class LikesController < ApplicationController
	before_action :authenticate_user!

	def like_spot_toggle
		@like = Like.find_by(user_id: current_user.id, spot_id: params[:spot_id])
		if @like.nil?
			Like.create(user_id: current_user.id, spot_id: params[:spot_id], post_id: nil)
		else
			@like.destroy
		end
		redirect_to :back
	end
	def like_post_toggle
		@like = Like.find_by(user_id: current_user.id, post_id: params[:post_id], spot_id: params[:spot_id])
		if @like.nil?
			Like.create(user_id: current_user.id, post_id: params[:post_id], spot_id: params[:spot_id])
		else
			@like.destroy
		end
		redirect_to :back
	end
end
