class Admin::HotelsController < Admin::BaseController
  def index
    @hotels = HotelServices.get_all_hotels
  end
end
