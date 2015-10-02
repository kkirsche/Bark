# Bark is a client for interacting with the Monit client.
module Bark
  # The Platform class hits the Status Monit API endpoint
  # and then segments it accordingly
  class Platform
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    # Retrieves the full platform object
    #
    # @return [`Hash`]
    # {
    #   :name => "Darwin",
    #   :release => "15.0.0",
    #   :version => "Darwin Kernel Version 15.0.0: Wed Aug 26 16:57:32 PDT 2015; root:xnu-3247.1.106~1/RELEASE_X86_64",
    #   :machine => "x86_64",
    #   :cpu => "4",
    #   :memory => "16777216",
    #   :swap => "0"
    # }
    def full
      @status.current[:monit][:platform]
    end

    # Retrieves the platform's name
    #
    # @return [String] `"Darwin"`
    def name
      @status.current[:monit][:platform][:name]
    end

    # Retrieves the platform's release number
    #
    # @return [String] `"15.0.0"`
    def release
      @status.current[:monit][:platform][:release]
    end

    # Retrieves the platform's version number
    #
    # @return [String] `"Darwin Kernel Version 15.0.0: Wed Aug 26 16:57:32 PDT 2015; root:xnu-3247.1.106~1/RELEASE_X86_64"`
    def version
      @status.current[:monit][:platform][:version]
    end

    # Retrieves the platform's machine type
    #
    # @return [String] `"x86_64"`
    def machine
      @status.current[:monit][:platform][:machine]
    end

    # Retrieves the platform's aggregate (user / system) CPU usage
    #
    # @return [String] `"4"`
    def cpu
      @status.current[:monit][:platform][:cpu]
    end

    # Retrieves the platform's total RAM (used & available)
    #
    # @return [String] `"16777216"`
    def memory
      @status.current[:monit][:platform][:memory]
    end

    # Retrieves the platform's total swap (used & available)
    #
    # @return [String] `"0"`
    def swap
      @status.current[:monit][:platform][:swap]
    end
  end
end
