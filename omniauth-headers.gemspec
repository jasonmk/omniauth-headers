# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-headers/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-headers"
  spec.version       = Omniauth::Headers::VERSION
  spec.authors       = ["Jason M. Kusar"]
  spec.email         = ["jason@kusar.net"]

  spec.summary       = %q{A simple OmniAuth strategy to read authentication from headers.}
  spec.description   = %q{A VERY simple OmniAuth strategy to pull header information placed by an authenticating reverse proxy.}
  spec.homepage      = "https://github.com/jasonmk/omniauth-headers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '>= 1.0'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'pry'
end
