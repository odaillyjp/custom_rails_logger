lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_rails_logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'custom_rails_commit'
  spec.version       = CustomRailsLogger::VERSION
  spec.authors       = ['Suguru Odai']
  spec.email         = ['ourqwers@gmail.com']
  spec.summary       = %q{custom_rails_logger}
  spec.description   = %q{Custom the Rails access log format.}
  spec.homepage      = 'https://github.com/odaillyjp/custom_rails_logger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.test_files    = spec.files.grep(/^test\//)
  spec.require_paths = ['lib']
end
