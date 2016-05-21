class Place
  include ActiveAttr::Model

  attr_accessor :id, :code, :name, :city, :country, :address, :services, :description
end
