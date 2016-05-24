class Admin::AirlinesController < Admin::BaseController
  def index
    @airlines = AirlineServices.get_all_airlines
  end

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new params[:airline]
    result = AirlineServices.add_new_airline params[:airline]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_airlines_path
      else
        flash[:danger] = "Failure!"
        @airline.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @airline.errors[:connection] = t "admin.airlines.errors.connection"
      render "new"
    end
  end
end
