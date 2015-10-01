require 'minitest_helper'

# BarkSpec is used to test the main client class
module BarkSpec
  describe 'Bark Server', 'The Monit XML API Server Class via Status' do
    it 'should initialize the correct type of client object' do
      client = Bark::Client.new
      expect(client.server).must_be_instance_of Bark::Server
    end

    it 'should retrieve the current server status from Monit' do
      client = Bark::Client.new
      response = client.server.status
      expect(response.keys).must_equal [:id, :incarnation, :version, :uptime,
                                        :poll, :startdelay, :localhostname,
                                        :controlfile, :httpd]
    end

    it 'should retrieve the current server id from Monit' do
      client = Bark::Client.new
      expect(client.server.id).must_equal '299c3f89d3fbf1a713917bf82eec09f4'
    end

    it 'should retrieve the current server id from Monit' do
      client = Bark::Client.new
      expect(client.server.incarnation).must_equal '1443715108'
    end

    it 'should retrieve the current monit agent version running on server' do
      client = Bark::Client.new
      expect(client.server.monit_version).must_equal '5.14'
    end

    it 'should retrieve the current server uptime from Monit' do
      client = Bark::Client.new
      response = client.server.uptime
      expect(response).wont_be_nil
      expect(response).must_be_instance_of String
    end

    it 'should retrieve the current monit poll rate' do
      client = Bark::Client.new
      expect(client.server.poll).must_equal '30'
    end

    it 'should retrieve the current monit delay rate' do
      client = Bark::Client.new
      expect(client.server.start_delay).must_equal '0'
    end

    it 'should retrieve the current monit delay rate' do
      client = Bark::Client.new
      regex = /\w{5}\d{3}\w{4}\d{2}\w\.local/
      expect(client.server.hostname).must_match regex
    end

    it 'should retrieve the current monit delay rate' do
      client = Bark::Client.new
      regex = %r(/Users/v\d{6}/\.monitrc)
      expect(client.server.control_file).must_match regex
    end

    it 'should retrieve the current monit http daemon config details' do
      client = Bark::Client.new
      hash = { address: 'localhost', port: '2812', ssl: '0' }
      expect(client.server.httpd).must_equal hash
    end

    it 'should retrieve the current monit http daemon config details' do
      client = Bark::Client.new
      expect(client.server.httpd_port).must_equal '2812'
    end

    it 'should retrieve the current monit http daemon config details' do
      client = Bark::Client.new
      expect(client.server.httpd_ssl).must_equal '0'
    end
  end
end
