module CustomRailsLogger
  module Formatter
    module_function

    # Format String
    #   %%: The percent sign
    #   %a: The request IP-address
    #   %{Foobar}C: The contents of cookie Foobar in the request sent to the server.
    #   %{Foobar}e: The contents of Foobar: header line(s) in the request sent to the server.
    #   %f: The filtered path
    #   %h: The request Host
    #   %m: The request method
    #   %p: The port of the server serving the request
    #   %s: The request schema
    #   %t: Time the request was received
    #   %u: The request user agent
    def call(message_format, request)
      tr_maps = message_format.scan(/%(?:{(.+?)})?(.)/)
        .map do |var_name, format_string|
          case format_string
          when '%' then '%'
          when 'a' then request.ip
          when 'C' then request.cookies[var_name]
          when 'e' then request.env[var_name]
          when 'f' then request.filtered_path
          when 'h' then request.host
          when 'm' then request.request_method
          when 'p' then request.port
          when 's' then request.scheme
          when 't' then Time.now.to_s
          when 'u' then request.user_agent
          else "%#{format_string}"
          end
        end

      message_format.gsub(/%(?:{.+?})?./, '%s') % tr_maps
    end
  end
end
