require 'minitest_helper'

# BarkSpec is used to test the main client class
module BarkSpec
  describe 'Bark Platform', 'The Monit API Client Class' do
    it 'should initialize the correct type of client object' do
      client = Bark::Client.new
      expect(client.platform).must_be_instance_of Bark::Platform
    end

    it 'should retrieve the full platform object' do
      client = Bark::Client.new
      hash = {
        name: 'Darwin',
        release: '14.5.0',
        version: 'Darwin Kernel Version 14.5.0: Wed Jul 29 02:26:53 PDT 2015;'\
                 ' root:xnu-2782.40.9~1/RELEASE_X86_64',
        machine: 'x86_64',
        cpu: '8',
        memory: '16777216',
        swap: '2097152'
      }
      expect(client.platform.full).must_equal hash
    end

    it "should retrieve the platform's name" do
      client = Bark::Client.new
      expect(client.platform.name).must_equal 'Darwin'
    end

    it "should retrieve the platform's release" do
      client = Bark::Client.new
      regex = /\d{2}\.\d\.\d/
      expect(client.platform.release).must_match regex
    end

    it "should retrieve the platform's version" do
      client = Bark::Client.new
      expect(client.platform.version).must_equal 'Darwin Kernel Version 14.5.0'\
                                                 ': Wed Jul 29 02:26:53 PDT 20'\
                                                 '15; root:xnu-2782.40.9~1/REL'\
                                                 'EASE_X86_64'
    end

    it "should retrieve the platform's version" do
      client = Bark::Client.new
      expect(client.platform.machine).must_equal 'x86_64'
    end

    it "should retrieve the platform's version" do
      client = Bark::Client.new
      expect(client.platform.cpu).must_equal '8'
    end

    it "should retrieve the platform's total memory" do
      client = Bark::Client.new
      expect(client.platform.memory).must_equal '16777216'
    end

    it "should retrieve the platform's swap memory" do
      client = Bark::Client.new
      expect(client.platform.swap).must_equal '2097152'
    end
  end
end
