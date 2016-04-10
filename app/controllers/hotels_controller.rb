class HotelsController < ApplicationController
  def index
    @hotels = HotelServices.get_all_hotels
    @places = TravelServices.get_all_places
  end
end
