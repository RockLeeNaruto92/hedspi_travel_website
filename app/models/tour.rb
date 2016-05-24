class Tour
  include ActiveAttr::Model

  attr_accessor :id, :code, :placeID, :startDate, :tickets, :cost, :description
end
