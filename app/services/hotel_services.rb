class HotelServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:3332/hotel_services/wsdl"
    end

    def get_all_hotels
      begin
        result = client.call :get_all_hotels
        JSON.parse result.to_hash[:get_all_hotels_response][:value]
      rescue
        []
      end
    end
  end
end
