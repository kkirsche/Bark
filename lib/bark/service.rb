# Bark is a client for interacting with the Monit client.
module Bark
  # The Service class hits the Status Monit API endpoint
  class Service
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    # Retrieves the services which Monit has running / is monitoring
    #
    # @return [Array]
    def each
      response = @status.current[:monit][:service]
      if response.is_a? Array
          @services = response.map do |service|
           service
          end
      else
        @services = [@hash["monit"]["service"]]
      end
      @services
    end

    private

    def validate(response)
      if response.status_type == :success
        document = Hash.from_xml(response.body)
      else
        fail StandardError, 'An unknown error occurred.'
      end
      document
    end
  end
end
