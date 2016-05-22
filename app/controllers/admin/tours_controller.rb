class Admin::ToursController < Admin::BaseController
  def index
    @tours = TravelServices.get_all_tours
  end
end
