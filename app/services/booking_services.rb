class BookingServices
  class << self
    def client
      @client ||= Savon::Client.new wsdl: "http://localhost:8080/ode/processes/Booking?wsdl"
    end

    def booking params
      begin
        result = client.call :process, message: params
        result.to_hash[:booking_response][:result]
      rescue
        false
      end
    end
  end
end
