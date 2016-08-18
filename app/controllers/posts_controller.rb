class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @spot = Spot.find(params[:spot_id])
    @post = @spot.posts.new
  end

  def show
    @spot = Spot.find(params[:spot_id])
    @post = @spot.posts.find(params[:id])
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

  def edit
    @spot = Spot.find(params[:spot_id])
    @post = @spot.posts.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @post = @spot.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @spot
    else
      render 'edit'
    end
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @post = @spot.posts.find(params[:id])
    @post.destroy
    redirect_to spot_path(@spot)
  end

  private
  def post_params
  	params.require(:post).permit(:body, :user)
  end
end
