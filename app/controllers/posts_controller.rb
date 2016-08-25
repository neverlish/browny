class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spot, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  
  def new
    @post = @spot ? @spot.posts.new : Post.new
  end

  def create
    	@post = @spot.posts.create(post_params)
    	@post.user = current_user
     @post.save ? (redirect_to @post) : (render 'new')
end


  def show 
  end

  def edit
  end

  def update
    @post.update(post_params) ? (redirect_to @spot) : (render 'edit')
  end

  def destroy
    @post.destroy
    redirect_to spot_path(@spot)
  end

  private
  def post_params
  	params.require(:post).permit(:body, :user,:picture, :title)
  end

  def set_spot
    @spot = Spot.find(params[:spot_id]) if params[:spot_id]
  end

  def set_post
    @post = params[:spot_id] ? @spot.posts.find(params[:id]) : Post.find(params[:id])
  end
end
