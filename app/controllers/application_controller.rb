class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @spot_categories = Spot.categories.keys
end
