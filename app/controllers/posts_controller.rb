class PostsController < ApplicationController
  before_action :set_spot, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :delete]
  def index
    @posts = Post.all
  end
  
  def new
    @post = @spot.posts.new
  end

  def create
  	@post = @spot.posts.create(post_params)
  	@post.user = current_user
    @post.save ? (redirect_to @spot) : (render 'new')
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
  	params.require(:post).permit(:body, :user)
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def set_post
    @post = @spot.posts.find(params[:id])
  end
end
