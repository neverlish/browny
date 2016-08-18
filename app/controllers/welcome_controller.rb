class WelcomeController < ApplicationController
  def index
  	@spots = Spot.all
  end
end
