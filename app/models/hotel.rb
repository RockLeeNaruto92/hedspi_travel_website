class Hotel
  include ActiveAttr::Model

  attr_accessor :id, :name, :star, :city, :country, :address, :website, :phone, :totalRooms,
    :available_rooms, :cost, :code
end
