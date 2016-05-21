class Admin::PlacesController < Admin::BaseController
  def index
    @places = TravelServices.get_all_places
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new params[:place]
    result = TravelServices.add_new_place params[:place]
    if result
      if result == "Successfully!"
        flash[:success] = "Successfully!"
        redirect_to admin_places_path
      else
        flash[:danger] = "Failure!"
        @place.errors[:warning] = JSON.parse result
        render "new"
      end
    else
      flash[:danger] = "Failure!"
      @place.errors[:connection] = t "admin.places.errors.connection"
      render "new"
    end
  end

  def edit
    @place = Place.new (TravelServices.get_place_by_id params[:id])
  end

  def update
    redirect_to admin_places_path
  end
end
