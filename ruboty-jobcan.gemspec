# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/jobcan/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-jobcan"
  spec.version       = Ruboty::Jobcan::VERSION
  spec.authors       = ["Tomoki Aonuma"]
  spec.email         = ["uasi@uasi.jp"]

  spec.summary       = %q{Ruboty plug-in for punching the clock on JOBCAN.}
  spec.description   = %q{Ruboty plug-in for punching the clock on JOBCAN.}
  spec.homepage      = "https://github.com/uasi/ruboty-jobcan"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "faraday", "~> 0.9.0"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.10.0"
  spec.add_runtime_dependency "faraday-cookie_jar", "~> 0.0.6"
end
