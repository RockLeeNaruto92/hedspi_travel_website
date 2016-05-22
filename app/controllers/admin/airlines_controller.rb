class Admin::AirlinesController < Admin::BaseController
  def index
    @airlines = AirlineServices.get_all_airlines
  end
end
