class TravelServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:3333/travel_services/wsdl"
    end

    def get_all_tours
      begin
        result = client.call :get_all_tours
        JSON.parse result.to_hash[:get_all_tours_response][:value]
      rescue
        []
      end
    end

    def get_all_places
      begin
        result = client.call :get_all_places
        JSON.parse result.to_hash[:get_all_places_response][:value]
      rescue
        []
      end
    end
  end
end
