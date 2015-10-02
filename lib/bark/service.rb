# Bark is a client for interacting with the Monit client.
module Bark
  # The Service class hits the Status Monit API endpoint
  class Service
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    def all
      @status.current[:monit][:service]
    end

    def id
      @status.current[:monit][:server][:id]
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
