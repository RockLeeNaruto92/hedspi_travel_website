class PlacesController < ApplicationController
  def show
    @place = TravelServices.get_place_by_id params[:id]
    @images = Image.of_place params[:id]
  end
end
