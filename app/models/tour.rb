class Tour
  include ActiveAttr::Model

  attr_accessor :id, :code, :place_id, :start_date, :tickets, :cost, :description
end
