class Admin::PlacesController < Admin::BaseController
  def index
    @places = TravelServices.get_all_places
  end
end
