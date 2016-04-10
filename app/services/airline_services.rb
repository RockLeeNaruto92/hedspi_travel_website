class AirlineServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:3331/airline_basic_services/wsdl"
    end

    def get_all_airlines
      begin
        result = client.call :get_all_airlines
        JSON.parse result.to_hash[:get_all_airlines_response][:value]
      rescue
        []
      end
    end

    def get_all_flights
      begin
        result = client.call :get_all_flights
        JSON.parse result.to_hash[:get_all_flights_response][:value]
      rescue
        []
      end
    end
  end
end
