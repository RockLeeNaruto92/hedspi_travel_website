class HotelsController < ApplicationController
  def index
    @hotels = HotelServices.get_all_hotels
    @places = TravelServices.get_all_places

    if params[:code].present?
      @hotel = HotelServices.get_hotel_by_code params[:code]
    end
  end
end
