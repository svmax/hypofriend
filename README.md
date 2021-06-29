# Hypofriend

Purpose of this gem to show how to make a simple plugin for API usage.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hypofriend', git: 'git@github.com:svmax/hypofriend.git'
```

And then execute:

    $ bundle

## Usage

To se how it works you can simply create a test.rb file:
```
require 'bundler'
Bundler.require(:default)

require 'hypofriend'

offer = Hypofriend::Api::V5::Offer.new
puts offer.receive_all(
  property_value: 350000,
  loan_amount: 350000,
  years_fixed: 15,
  repayment: 1.0,
)
```
and run `ruby test.rb` into the console. Here we go =)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
