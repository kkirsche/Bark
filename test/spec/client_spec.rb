require 'minitest_helper'

# BarkSpec is used to test the main client class
module BarkSpec
  describe 'Bark Client', 'The Monit API Client Class' do
    it 'should initialize the correct type of client object' do
      client = Bark::Client.new
      expect(client).must_be_instance_of Bark::Client
    end

    it 'should have a version number' do
      expect(Bark::VERSION).wont_be_nil
    end

    it 'should include a default monit host' do
      client = Bark::Client.new
      expect(client.host).must_equal 'localhost'
    end

    it 'should include a default monit port number' do
      client = Bark::Client.new
      expect(client.port).must_equal '2812'
    end

    it 'should include a default monit username' do
      client = Bark::Client.new
      expect(client.user).must_equal 'admin'
    end

    it 'should include a default password' do
      client = Bark::Client.new
      expect(client.password).must_equal 'monit'
    end

    it 'should use the user defined data instead of defaults' do
      opts = {
        user: 'testUser',
        pass: 'testPass',
        host: 'testHost.com',
        port: '0000'
      }
      client = Bark::Client.new opts
      expect(client.user).must_equal 'testUser'
      expect(client.password).must_equal 'testPass'
      expect(client.host).must_equal 'testHost.com'
      expect(client.port).must_equal '0000'
    end
  end
end
