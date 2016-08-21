class WelcomeController < ApplicationController
  def index
		@categories = Spot.categories.keys
  end
end
