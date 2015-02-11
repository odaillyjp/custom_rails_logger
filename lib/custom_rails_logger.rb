require 'custom_rails_logger/configuration'
require 'custom_rails_logger/formatter'
require 'custom_rails_logger/version'
require 'custom_rails_logger/rails_ext/rack/logger'

module CustomRailsLogger
  def self.configuration
    @configuration ||= CustomRailsLogger::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
    configuration.setting
  end
end
