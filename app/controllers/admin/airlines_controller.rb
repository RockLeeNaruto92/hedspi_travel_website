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

  def edit
    @airline = Airline.new AirlineServices.get_airline_by_id(params[:id])
  end

  def update
    @airline = Airline.new AirlineServices.get_airline_by_id(params[:id])
    result = AirlineServices.update_airline params[:airline]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_airlines_path
      else
        flash[:danger] = "Failure!"
        @airline.errors[:warning] = JSON.parse result
        render "edit"
      end
    else
      flash[:danger] = "Failure!"
      @airline.errors[:connection] = t "admin.airlines.errors.connection"
      render "edit"
    end
  end
end
