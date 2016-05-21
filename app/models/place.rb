class Place
  include ActiveAttr::Model

  attr_accessor :code, :name, :city, :country, :address, :services, :description
end
