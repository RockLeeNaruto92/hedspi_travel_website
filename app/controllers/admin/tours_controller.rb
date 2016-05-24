class Admin::ToursController < Admin::BaseController
  def index
    @tours = TravelServices.get_all_tours
  end

  def new
    @places = TravelServices.get_all_places
    @tour = Tour.new
  end

  def create
    @tour = Tour.new params[:tour]
    @places = TravelServices.get_all_places
    result = TravelServices.add_new_tour params[:tour]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_tours_path
      else
        flash[:danger] = "Failure!"
        @tour.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @tour.errors[:connection] = t "admin.places.errors.connection"
      render "new"
    end
  end

  def edit
    @places = TravelServices.get_all_places
    @tour = Tour.new (TravelServices.get_tour_by_id params[:id])
  end

  def update
    @tour = Tour.new params[:tour]
    @places = TravelServices.get_all_places
    result = TravelServices.update_tour params[:tour]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_tours_path
      else
        flash[:danger] = "Failure!"
        @tour.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @tour.errors[:connection] = t "admin.places.errors.connection"
      render "new"
    end
  end
end
