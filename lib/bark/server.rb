# Bark is a client for interacting with the Monit client.
module Bark
  # The Server class hits the Status Monit API endpoint and then segments
  # it accordingly
  class Server
    def initialize(client)
      @client = client
      @status = Bark::Status.new client
    end

    def status
      @status.current[:monit][:server]
    end

    def id
      @status.current[:monit][:server][:id]
    end

    def incarnation
      @status.current[:monit][:server][:incarnation]
    end

    def monit_version
      @status.current[:monit][:server][:version]
    end

    def uptime
      @status.current[:monit][:server][:uptime]
    end

    def poll
      @status.current[:monit][:server][:poll]
    end

    def start_delay
      @status.current[:monit][:server][:startdelay]
    end

    def hostname
      @status.current[:monit][:server][:localhostname]
    end

    def control_file
      @status.current[:monit][:server][:controlfile]
    end

    def httpd
      @status.current[:monit][:server][:httpd]
    end

    def httpd_address
      @status.current[:monit][:server][:httpd][:address]
    end

    def httpd_port
      @status.current[:monit][:server][:httpd][:port]
    end

    def httpd_ssl
      @status.current[:monit][:server][:httpd][:ssl]
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
