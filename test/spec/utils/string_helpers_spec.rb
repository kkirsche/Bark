require 'minitest_helper'

# BarkSpec is used to test the main client class
module BarkSpec
  describe 'Bark String Helper Functions', 'The monkey-patched string class' do
    it 'should return the last character of the string' do
      expect('Example'.last_character).must_equal 'e'
    end

    it 'should return a copy of what itself with a trailing slash' do
      expect('www.example.com'.with_trailing_slash).must_equal 'www.example.com/'
    end

    it 'should return a copy of what itself with a trailing slash' do
      expect('www.example.com/'.with_trailing_slash).must_equal 'www.example.com/'
    end
  end
end
