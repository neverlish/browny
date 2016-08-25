class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:before_login]
  def before_login 

  end
  def index
	@categories = Spot.categories.keys
  end

  def main
  	@posts = Post.all
  end	
end