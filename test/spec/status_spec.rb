require 'minitest_helper'

# BarkSpec is used to test the main client class
module BarkSpec
  describe 'Status', 'The Monit XML API Status Class' do
    it 'should initialize the correct type of client object' do
      client = Bark::Client.new
      expect(client.status).must_be_instance_of Bark::Status
    end

    it 'should retrieve the current status from Monit' do
      client = Bark::Client.new
      response = client.status.current
      expect(response).wont_be_nil
      expect(response).must_be_instance_of Hash
    end
  end
end
