[![Build Status](https://travis-ci.org/jasonmk/omniauth-headers.svg?branch=master)](https://travis-ci.org/jasonmk/omniauth-headers)

# OmniAuth::Strategies::Headers

A VERY simple OmniAuth strategy to pull user information from headers. This is useful in
situations where you have an authenticating reverse proxy in front of your application
that places user information into the request headers.

Technically speaking, you probably don't need omniauth in this case since the whole
redirect/callback system in unnecessary (every request has the user information already),
however, if your application uses multiple different authentication schemes, you may find
it easier to use this than trying to swap omniauth in and out.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-headers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-headers

## Usage

As a middleware in your Rack application:

```ruby
  require 'omniauth'
  use OmniAuth::Strategies::Headers,
    headers: { uid: 'HTTP_USER_ID', email: 'HTTP_EMAIL' },
    uid_field: :uid
```

or in your Rails application:

in Gemfile:
 
```ruby
  gem 'omniauth-headers'
```

in config/initializers/omniauth.rb

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :headers,
      headers: { uid: 'HTTP_USER_ID', email: 'HTTP_EMAIL' },
      uid_field: :uid
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jasonmk/omniauth-headers.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
