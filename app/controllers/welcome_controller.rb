class WelcomeController < ApplicationController
  def index
		@places = Place.all
		@hash = Gmaps4rails.build_markers(@places) do |place, marker|
			marker.lat place.latitude
			marker.lng place.longitude
		end
		@categories = Spot.categories.keys
  end
end
