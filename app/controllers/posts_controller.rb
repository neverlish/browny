class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @spot = Spot.find(params[:spot_id])
  	@post = @spot.posts.create(post_params)
  	@post.user = current_user
  	if @post.save
  		redirect_to @spot
  	else
  		render 'new'
  	end
  end

  def show
  end

  private
  def post_params
  	params.require(:post).permit(:body, :user)
  end
end
