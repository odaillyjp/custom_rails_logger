# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_rails_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "custom_rails_logger"
  spec.version       = CustomRailsLogger::VERSION
  spec.authors       = ["Suguru Odai"]
  spec.email         = ["ourqwers@gmail.com"]
  spec.summary       = %q{custom_rails_logger}
  spec.description   = %q{Custom a access log format for Rails.}
  spec.homepage      = "https://github.com/odaillyjp/custom_rails_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
