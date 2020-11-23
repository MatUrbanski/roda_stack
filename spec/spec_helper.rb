# frozen_string_literal: true

require 'rake'
require 'database_cleaner'
require 'rack/test'

require_relative '../config/models'
require_relative '../app'

# Set RACK_ENV to test.
ENV['RACK_ENV'] = 'test'

# Disable database logs during test launch.
DB.loggers = []

# Require all files in spec/support folder.
root_path = Pathname.new(File.expand_path('..', __dir__))
Dir[root_path.join('spec/support/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include ApiHelpers,          type: :request

  config.include(Module.new do
    def app
      App.freeze.app
    end
  end)

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
