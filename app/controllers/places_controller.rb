class PlacesController < ApplicationController
  def index
    @places = TravelServices.get_all_places
    @images = Image.of_many_places get_place_ids
  end

  def show
    @place = TravelServices.get_place_by_id params[:id]
    @images = Image.of_place params[:id]
  end

  private
  def get_place_ids
    @places.map{|place| place["id"]}
  end
end
