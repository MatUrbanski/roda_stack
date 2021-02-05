# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.0'

# Routing Tree Web Toolkit.
gem 'roda', '>= 3.38'

# Use Puma as the app server.
gem 'puma', '~> 5.2'

# A make-like build utility for Ruby.
gem 'rake'

# Sequel: The Database Toolkit for Ruby.
gem 'sequel', '>= 5.38'

# Faster SELECTs when using Sequel with pg.
gem 'sequel_pg', '>= 1.14'

# A runtime developer console and IRB alternative with powerful introspection capabilities.
gem 'pry'

# Ruby internationalization and localization (i18n) solution.
gem 'i18n'

# YARD is a Ruby Documentation tool. The Y stands for "Yay!"
gem 'yard'

# A fast JSON parser and Object marshaller as a Ruby gem.
gem 'oj'

# A toolkit of support libraries and Ruby core extensions extracted from the Rails framework.
gem 'activesupport', '>= 6.0.3.4'

# bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.
gem 'bcrypt'

# Validation library with type-safe schemas and rules.
gem 'dry-validation'

# A powerful logger for Roda with a few tricks up it's sleeve.
gem 'roda-enhanced_logger'

# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'

# Organize your code into reusable components.
gem 'dry-system'

group :development do
  # Preview mail in the browser instead of sending.
  gem 'letter_opener'
end

group :development, :test do
  # A library for setting up Ruby objects as test data.
  gem 'factory_bot'

  # A Ruby gem to load environment variables from `.env`.
  gem 'dotenv'

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem 'rubocop'

  # An extension of RuboCop focused on code performance checks.
  gem 'rubocop-performance'

  # Code style checking for RSpec files.
  gem 'rubocop-rspec'

  # Thread-safety analysis for your projects.
  gem 'rubocop-thread_safety'

  # RSpec meta-gem that depends on the other components.
  gem 'rspec'

  # Rack::Test is a layer on top of Rack's MockRequest similar to Merb's RequestHelper.
  gem 'rack-test'

  # A gem providing "time travel", "time freezing", and "time acceleration" capabilities, making it simple to test time-dependent code. It provides a unified method to mock Time.now, Date.today, and DateTime.now in a single call.
  gem 'timecop'
end
