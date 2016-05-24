class HotelServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:3332/hotel_basic_services/wsdl"
    end

    def get_all_hotels
      begin
        result = client.call :get_all_hotels
        JSON.parse result.to_hash[:get_all_hotels_response][:value]
      rescue
        []
      end
    end

    def get_hotel_by_code code
      begin
        result = client.call :find_hotel_by_code, message: {code: code}
        JSON.parse result.to_hash[:find_hotel_by_code_response][:value]
      rescue
        {}
      end
    end

    def get_hotel_by_id id
      begin
        result = client.call :get_hotel_by_id, message: {id: id}
        JSON.parse result.to_hash[:get_hotel_by_id_response][:value]
      rescue
        nil
      end
    end

    def add_new_hotel params
      begin
        result = client.call :add_new_hotel, message: params
        result.to_hash[:add_new_hotel_response][:value]
      rescue
        nil
      end
    end

    def update_hotel params
      begin
        result = client.call :update_hotel, message: params
        result.to_hash[:update_hotel_response][:value]
      rescue
        nil
      end
    end
  end
end
