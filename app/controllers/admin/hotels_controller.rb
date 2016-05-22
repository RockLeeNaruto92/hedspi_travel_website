class Admin::HotelsController < Admin::BaseController
  def index
    @hotels = HotelServices.get_all_hotels
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new params[:hotel]
    result = HotelServices.add_new_hotel params[:hotel]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_hotels_path
      else
        flash[:danger] = "Failure!"
        @hotel.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @hotel.errors[:connection] = t "admin.hotels.errors.connection"
      render "new"
    end
  end
end
