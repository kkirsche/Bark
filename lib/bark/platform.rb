# Bark is a client for interacting with the Monit client.
module Bark
  # The Platform class hits the Status Monit API endpoint
  # and then segments it accordingly
  class Platform
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    def full
      @status.current[:monit][:platform]
    end

    def name
      @status.current[:monit][:platform][:name]
    end

    def release
      @status.current[:monit][:platform][:release]
    end

    def version
      @status.current[:monit][:platform][:version]
    end

    def machine
      @status.current[:monit][:platform][:machine]
    end

    def cpu
      @status.current[:monit][:platform][:cpu]
    end

    def memory
      @status.current[:monit][:platform][:memory]
    end

    def swap
      @status.current[:monit][:platform][:swap]
    end
  end
end
