module CustomRailsLogger
  class Configuration
    attr_accessor :started_request_message_format

    # Default format
    #   started request message:
    #     'Started GET "/session/new" for 127.0.0.1 at 2012-09-26 14:51:42 -0700'
    def initialize
      @started_request_message_format = 'Started %m "%f" for %a at %t'
    end
  end
end
