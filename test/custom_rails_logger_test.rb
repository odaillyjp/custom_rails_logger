require 'minitest/unit'
require 'minitest/autorun'

$LOAD_PATH.unshift(File.expand_path('../lib/', __dir__))
require 'custom_rails_logger/formatter'

class DummyRequest
  attr_accessor :ip,
    :cookies,
    :env,
    :filtered_path,
    :host,
    :request_method,
    :port,
    :scheme,
    :user_agent
end

module CustomRailsLogger
  class TestFormatter < MiniTest::Unit::TestCase
    def setup
      @request = DummyRequest.new.tap do |req|
        req.ip = '192.168.0.1'
        req.cookies = { 'foo' => 'foo' }
        req.env = { 'bar' => 'bar'}
        req.filtered_path = '/path/to'
        req.host = 'localhost'
        req.request_method = 'GET'
        req.port = '80'
        req.scheme = 'http'
        req.user_agent = 'Browser'
      end
    end

    def test_call_parcent_pattern
      result = CustomRailsLogger::Formatter.call('Started % %% %%%', @request)
      assert_equal 'Started % % %%', result
    end

    def test_call_ip_pattern
      result = CustomRailsLogger::Formatter.call('Started %a %%a %%%a', @request)
      assert_equal 'Started 192.168.0.1 %a %192.168.0.1', result
    end

    def test_call_cookies_pattern
      result = CustomRailsLogger::Formatter.call('Started %{foo}C %{hoge}C', @request)
      assert_equal 'Started foo ', result
    end

    def test_call_env_pattern
      result = CustomRailsLogger::Formatter.call('Started %{bar}e %{hoge}e', @request)
      assert_equal 'Started bar ', result
    end

    def test_call_path_pattern
      result = CustomRailsLogger::Formatter.call('Started "%f"', @request)
      assert_equal 'Started "/path/to"', result
    end

    def test_call_host_pattern
      result = CustomRailsLogger::Formatter.call('Started %h', @request)
      assert_equal 'Started localhost', result
    end

    def test_call_method_pattern
      result = CustomRailsLogger::Formatter.call('Started %m', @request)
      assert_equal 'Started GET', result
    end

    def test_call_port_pattern
      result = CustomRailsLogger::Formatter.call('Started %p', @request)
      assert_equal 'Started 80', result
    end

    def test_call_scheme_pattern
      result = CustomRailsLogger::Formatter.call('Started %s', @request)
      assert_equal 'Started http', result
    end

    def test_call_agent_pattern
      result = CustomRailsLogger::Formatter.call('Started %u', @request)
      assert_equal 'Started Browser', result
    end
  end
end
