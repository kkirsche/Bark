# Bark is a client for interacting with the Monit client.
module Bark
  # The Server class hits the Status Monit API endpoint and then segments
  # it accordingly
  class Server
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    # Retrieves the server's status
    #
    # @return [Hash] `{:id=>"4674ff31c162bba574525571642b67fd", :incarnation=>"1443740471", :version=>"5.14", :uptime=>"14536", :poll=>"30", :startdelay=>"0", :localhostname=>"JohnDoe-Laptop.com", :controlfile=>"/Users/jdoe/.monitrc", :httpd=>{:address=>"localhost", :port=>"2812", :ssl=>"0"}}`
    def status
      @status.current[:monit][:server]
    end

    # Retrieves the platform's id
    #
    # @return [String] `"4674ff31c162bba574525571642b67fd"`
    def id
      @status.current[:monit][:server][:id]
    end

    # Retrieves the platform's incarnation
    #
    # @return [String] `"1443740471"`
    def incarnation
      @status.current[:monit][:server][:incarnation]
    end

    # Retrieves the platform's monit version number
    #
    # @return [String] `"5.14"`
    def monit_version
      @status.current[:monit][:server][:version]
    end

    # Retrieves the platform's uptime
    #
    # @return [String] `"14536"`
    def uptime
      @status.current[:monit][:server][:uptime]
    end

    # Retrieves the platform's polling rate
    #
    # @return [String] `"30"`
    def poll
      @status.current[:monit][:server][:poll]
    end

    # Retrieves the platform's start delay time
    #
    # @return [String] `"0"`
    def start_delay
      @status.current[:monit][:server][:startdelay]
    end

    # Retrieves the platform's hostname
    #
    # @return [String] `"JohnDoe-Laptop.com"`
    def hostname
      @status.current[:monit][:server][:localhostname]
    end

    # Retrieves the platform's control file path
    #
    # @return [String] `"/Users/jdoe/.monitrc"`
    def control_file
      @status.current[:monit][:server][:controlfile]
    end

    # Retrieves the platform's httpd instance object
    #
    # @return [Hash] `{:address=>"localhost", :port=>"2812", :ssl=>"0"}`
    def httpd
      @status.current[:monit][:server][:httpd]
    end

    # Retrieves the platform's httpd instance address / hostname
    #
    # @return [String] `"localhost"`
    def httpd_address
      @status.current[:monit][:server][:httpd][:address]
    end

    # Retrieves the platform's httpd instance port number
    #
    # @return [String] `"2812"`
    def httpd_port
      @status.current[:monit][:server][:httpd][:port]
    end

    # Retrieves the platform's httpd instance SSL boolean (binary)
    #
    # @return [String] `"0"`
    def httpd_ssl
      @status.current[:monit][:server][:httpd][:ssl]
    end

    private

    # Validates whether we successfully retrieved the response or if we got an unknown / unexpected
    # error.
    #
    # @return [Hash]
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
