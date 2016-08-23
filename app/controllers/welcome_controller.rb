class WelcomeController < ApplicationController
	@spot_categories = Spot.categories.keys
  def index
		@categories = Spot.categories.keys
  end

  def main
  	@posts = Post.all
  end	
end