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

    def add_new_airline params
      begin
        result = client.call :add_new_airline, message: params
        result.to_hash[:add_new_airline_response][:value]
      rescue
        nil
      end
    end

    def add_new_flight params
      begin
        result = client.call :add_new_flight, message: params
        result.to_hash[:add_new_flight_response][:value]
      rescue
        nil
      end
    end
  end
end
