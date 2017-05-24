# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'check_and_notify/version'

Gem::Specification.new do |spec|
  spec.name          = "check_and_notify"
  spec.version       = CheckAndNotify::VERSION
  spec.authors       = ["Neil Marion dela Cruz"]
  spec.email         = ["nmfdelacruz@gmail.com"]

  spec.summary       = %q{Calls a callback regularly and notifies when it returns true}
  spec.description   = %q{Calls a callback regularly and notifies when it returns true}
  spec.homepage      = "https://github.com/carabao-capital/check_and_notify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '~> 4.2', '>= 4.2.0'
  spec.add_dependency "sidekiq", "5.0.4"
  spec.add_dependency "sidekiq-cron", "0.6.3"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-nav", "~> 0.2.4"
end
