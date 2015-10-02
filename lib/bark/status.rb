# Bark is a client for interacting with the Monit client.
module Bark
  # The Status class hits the Status Monit API endpoint
  class Status
    def initialize(client)
      @client = client
    end

    # Retrieves the current status of Monit. **Note:** This is the top level API object
    #
    # @return [String] `"localhost"`
    def current
      response = @client.get('_status', format: 'xml')
      validate response
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
