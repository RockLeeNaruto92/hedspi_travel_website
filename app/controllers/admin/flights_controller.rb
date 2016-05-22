class Admin::FlightsController < Admin::BaseController
  def index
    @flights = AirlineServices.get_all_flights
  end
end
