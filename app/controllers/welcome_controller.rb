class WelcomeController < ApplicationController
  def index
		@categories = Spot.categories.keys
  end

  def main
  	@posts = Post.all
  end	
end