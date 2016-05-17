class HotelsController < ApplicationController
  before_action :load_data, only: [:index, :show]

  def index
  end

  def show
    @hotel = HotelServices.get_hotel_by_code params[:id]
  end

  private
  def load_data
    @hotels = HotelServices.get_all_hotels
    @places = TravelServices.get_all_places
  end
end
