class Flight
  include ActiveAttr::Model

  attr_accessor :id, :code, :airlineID, :startTime, :endTime, :startPoint, :endPoint,
    :seats, :availableSeats, :cost
end
