require "bundler/setup"
require 'simplecov'
SimpleCov.start
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'
require "omniauth-headers"

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.include OmniAuth::Test::StrategyMacros, type: :strategy
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
