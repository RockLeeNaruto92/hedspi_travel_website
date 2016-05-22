class Admin::FlightsController < Admin::BaseController
  def index
    @flights = AirlineServices.get_all_flights
  end

  def new
    @flight = Flight.new
    @airlines = AirlineServices.get_all_airlines
  end

  def create
    @flight = Flight.new params[:flight]
    @airlines = AirlineServices.get_all_airlines
    result = AirlineServices.add_new_flight params[:flight]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_flights_path
      else
        flash[:danger] = "Failure!"
        @flight.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @flight.errors[:connection] = t "admin.airlines.errors.connection"
      render "new"
    end

  end
end
