class ToursController < ApplicationController
  def index
    @tour = TravelServices.get_tour_by_code params[:code]
    @images = Image.of_place @tour["place_id"]
  end
end
