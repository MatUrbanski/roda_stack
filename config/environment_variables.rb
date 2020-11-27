# frozen_string_literal: true

# This file contains setup for environment variables using Dotenv.

# Set default value for 'RACK_ENV' to 'development'.
env = ENV['RACK_ENV'] ||= 'development'

# Load environment variables if current environment is development or test.
if %w[development test].include?(env)
  require 'dotenv'

  Dotenv.load('.env', ".env.#{env}")
end
