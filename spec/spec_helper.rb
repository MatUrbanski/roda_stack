# frozen_string_literal: true

# Set RACK_ENV to test.
ENV['RACK_ENV'] = 'test'

require 'rack/test'

require_relative '../config/boot'
require_relative '../app'

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

  # Configuration for database cleaning strategy using Sequel.
  config.around do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) { example.run }
  end
end
