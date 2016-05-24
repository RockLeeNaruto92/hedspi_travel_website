class BookingsController < ApplicationController
  def index
    load_info
  end

  def create
    load_info
    set_check_in_out_date

    result = BookingServices.booking params[:bookings]

    if result == "success"
      redirect_to bookings_path({info: :success})
    else
      redirect_to bookings_path({info: :failure, bookings: params[:bookings]})
    end
  end

  private
  def load_info
    @places = TravelServices.get_all_places
    @hotels = HotelServices.get_all_hotels
    @airlines = AirlineServices.get_all_airlines

    @tours = TravelServices.get_all_tours
    @flights = AirlineServices.get_all_flights
  end

  def set_check_in_out_date
    tour = @tours.select{|tour| tour["id"] == params[:bookings][:tourId].to_i}.first
    if tour
      params[:bookings][:checkInDate] = tour["start_date"]
      params[:bookings][:checkOutDate] = (tour["start_date"].to_date + 5.days).to_s
    end
  end
end
