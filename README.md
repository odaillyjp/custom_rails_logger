# CustomRailsLogger

# Installation

Add `custom_rails_logger` in the `Gemfile`.

```ruby
gem 'custom_rails_logger'
```

Download and install by running.

```ruby
bundle install
```

# Configuration

Create an initializer in the `config/initializers/custom_rails_logger.rb`.

That by adding with:

```ruby
CustomRailsLogger.configure do |config|
  config.started_request_message_format = 'Started %m "%f" for %a by %u at %t'
end
```

When requested to `/session/new`, write the customized log message to `log/*.log`.

```
Started GET "/session/new" for 128.0.0.1 by Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0 at 2012-09-26 14:51:42 -0700
```

# Custom Log Formats

```
Format String
  %%: The percent sign
  %a: The request IP-address
  %{Foobar}C: The contents of cookie Foobar in the request sent to the server.
  %{Foobar}e: The contents of Foobar: header line(s) in the request sent to the server.
  %f: The filtered path
  %h: The request Host
  %m: The request method
  %p: The port of the server serving the request
  %s: The request schema
  %t: Time the request was received
  %u: The request user agent
```

# Get involved

TODO
