# Bark is a client for interacting with the Monit client.
module Bark
  # The Client class is the primary communicator between the program and the
  class Client
    # `:host` = The hostname of the Monit server
    # `:port` = The port used to connect to the Monit server
    # `:user` = The username used for basic auth with Monit server
    # `:password` = The password used for basic auth with Monit server
    # `:status` = The status xml api endpoint client
    # `:server` = The server section retrieved via the status xml api
    # `:platform` = The platform section retrieved via the status xml api
    # `:service` = The service section retrieved via the status xml api
    attr_reader :host, :port, :user, :password, :status, :server, :platform, :service
    def initialize(opts = {})
      default_if_opts_nil opts
      @client = Hurley::Client.new "http://#{@user}:#{@password}"\
                                   "@#{@host}:#{@port}"
    end

    # Used for access to the top level XML data
    #
    # @return [`Bark::Status`] Bark status client
    def status
      @status ||= Bark::Status.new @client
    end

    # Used for access to the server section of the XML data
    #
    # @return [`Bark::Server`] Bark server client
    def server
      @server ||= Bark::Server.new @client
    end

    # Used for access to the platform section of the XML data
    #
    # @return [`Bark::Platform`] Bark platform client
    def platform
      @platform ||= Bark::Platform.new @client
    end

    # Used for access to the service section of the XML data
    #
    # @return [`Bark::Service`] Bark service client
    def service
      @service ||= Bark::Service.new @client
    end

    private

    # Used to determine whether or not the user provided the Monit server's hostname,
    # port, username, and password.
    #
    # @return [`Symbol`]
    def default_if_opts_nil(opts)
      @host = decide_if_default_or_user_input opts[:host], default_host
      @port = decide_if_default_or_user_input opts[:port], default_port
      @user = decide_if_default_or_user_input opts[:user], default_user
      @password = decide_if_default_or_user_input opts[:pass], default_password
      :ok
    end

    # Checks if the value / option is nil. If it is, use the default value, otherwise, use the user
    # provided input.
    #
    # @return [`String`]
    def decide_if_default_or_user_input(opt, default)
      if opt.nil?
        return default
      else
        return opt
      end
    end

    # Monit's default hostname
    #
    # @return [`String`]
    def default_host
      @host = 'localhost'
    end

    # Monit's default port number
    #
    # @return [`String`]
    def default_port
      @port = '2812'
    end

    # Monit's default username
    #
    # @return [`String`]
    def default_user
      @user = 'admin'
    end

    # Monit's default password
    #
    # @return [`String`]
    def default_password
      @password = 'monit'
    end
  end
end
