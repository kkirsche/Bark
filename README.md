[![Gem Version](https://badge.fury.io/rb/barking.svg)](http://badge.fury.io/rb/barking)

# Bark

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bark`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bark

## Usage

Require Bark:

```ruby
require 'barking'
```

Create a Bark client:
```ruby
client = Bark::Client.new
=> #<Bark::Client:0x007fd0aa08c6e0
 @client=
  #<Hurley::Client:0x007fd0aa08c3c0
   @after_callbacks=[],
   @before_callbacks=[],
   @connection=nil,
   @header=#<Hurley::Header {"User-Agent"=>"Hurley v0.2"}>,
   @request_options=
    #<struct Hurley::RequestOptions
     timeout=nil,
     open_timeout=nil,
     boundary=nil,
     bind=nil,
     proxy=nil,
     redirection_limit=nil,
     query_class=nil>,
   @ssl_options=
    #<struct Hurley::SslOptions
     skip_verification=nil,
     verify_depth=nil,
     ca_file=nil,
     ca_path=nil,
     client_cert=nil,
     client_cert_path=nil,
     private_key=nil,
     private_key_path=nil,
     private_key_pass=nil,
     openssl_client_cert=nil,
     openssl_client_key=nil,
     openssl_cert_store=nil,
     version=nil>,
   @url=#<Hurley::Url http://localhost:2812>>,
 @host="localhost",
 @password="monit",
 @port="2812",
 @user="admin">
```

Use the Bark client:
```ruby
client = Bark::Client.new
client.status.current
 => {:monit=>
  {:server=>
    {:id=>"4674ff31c162bba574525571642b67fd",
     :incarnation=>"1443740471",
     :version=>"5.14",
     :uptime=>"16012",
     :poll=>"30",
     :startdelay=>"0",
     :localhostname=>"JohnDoe-Laptop.com",
     :controlfile=>"/Users/jdoe/.monitrc",
     :httpd=>{:address=>"localhost", :port=>"2812", :ssl=>"0"}},
   :platform=>
    {:name=>"Darwin",
     :release=>"15.0.0",
     :version=>
      "Darwin Kernel Version 15.0.0: Wed Aug 26 16:57:32 PDT 2015; root:xnu-3247.1.106~1/RELEASE_X86_64",
     :machine=>"x86_64",
     :cpu=>"4",
     :memory=>"16777216",
     :swap=>"0"},
   :service=>
    {:type=>"5",
     :name=>"JohnDoe-Laptop.com",
     :collected_sec=>"1443756456",
     :collected_usec=>"430689",
     :status=>"0",
     :status_hint=>"0",
     :monitor=>"1",
     :monitormode=>"0",
     :pendingaction=>"0",
     :system=>
      {:load=>{:avg01=>"2.16", :avg05=>"1.87", :avg15=>"1.81"},
       :cpu=>{:user=>"10.9", :system=>"5.0"},
       :memory=>{:percent=>"54.1", :kilobyte=>"9080656"},
       :swap=>{:percent=>"0.0", :kilobyte=>"0"}}}}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Questions, comments, bug reports, and pull requests are all welcomed on Github at https://github.com/kkirsche/bark.

## Authors

* [Kevin Kirsche](https://github.com/kkirsche)

