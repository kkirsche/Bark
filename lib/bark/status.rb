# Bark is a client for interacting with the Monit client.
module Bark
  # The Status class hits the Status Monit API endpoint
  class Status
    def initialize(client)
      @client = client
    end

    def current
      response = @client.get('_status', format: 'xml')
      document = Hash.from_xml(response.body)
    end
  end
end
