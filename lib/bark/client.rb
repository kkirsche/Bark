# Bark is a client for interacting with the Monit client.
module Bark
  # The Client class is the primary communicator between the program and the
  class Client
    attr_reader :host, :port, :user, :password, :status
    def initialize(opts = {})
      default_if_opts_nil opts
      @client = Hurley::Client.new "http://#{@user}:#{@password}"\
                                   "@#{@host}:#{@port}"
    end

    def status
      @status ||= Bark::Status.new(@client)
    end

    private

    def default_if_opts_nil(opts)
      @host = decide_if_default_or_user_input opts[:host], default_host
      @port = decide_if_default_or_user_input opts[:port], default_port
      @user = decide_if_default_or_user_input opts[:user], default_user
      @password = decide_if_default_or_user_input opts[:pass], default_password
    end

    def decide_if_default_or_user_input(opt, default)
      if opt.nil?
        return default
      else
        return opt
      end
    end

    def default_host
      @host = 'localhost'
    end

    def default_port
      @port = '2812'
    end

    def default_user
      @user = 'admin'
    end

    def default_password
      @password = 'monit'
    end
  end
end
