# frozen_string_literal: true

# This file contains logger configuration.

# Do not log database statements in test environment.
unless ENV['RACK_ENV'] == 'test'
  require 'logger'
  LOGGER = Logger.new($stdout)
  DB.loggers << LOGGER
end
