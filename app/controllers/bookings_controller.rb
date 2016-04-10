class BookingsController < ApplicationController
  def index
    @places = TravelServices.get_all_places
    @hotels = HotelServices.get_all_hotels
    @airlines = AirlineServices.get_all_airlines

    @tours = TravelServices.get_all_tours
    @flights = AirlineServices.get_all_flights
  end
end
