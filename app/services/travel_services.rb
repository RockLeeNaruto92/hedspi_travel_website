class TravelServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:3333/travel_basic_services/wsdl"
    end

    def get_all_tours
      begin
        result = client.call :get_all_tours
        JSON.parse result.to_hash[:get_all_tours_response][:value]
      rescue
        []
      end
    end

    def get_tour_by_code code
      begin
        result = client.call :find_tour_by_code, message: {code: code}
        JSON.parse result.to_hash[:find_tour_by_code_response][:value]
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

    def get_place_by_id id
      begin
        result = client.call :get_place_by_id, message: {id: id}
        JSON.parse result.to_hash[:get_place_by_id_response][:value]
      rescue
        nil
      end
    end
  end
end
