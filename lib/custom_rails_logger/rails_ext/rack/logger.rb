module Rails
  module Rack
    class Logger < ActiveSupport::LogSubscriber
      def started_request_message(request)
        message_format = CustomRailsLogger.configuration.started_request_message_format
        CustomRailsLogger::Formatter.call(message_format, request)
      end
    end
  end
end
