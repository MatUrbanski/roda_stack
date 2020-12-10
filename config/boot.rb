# frozen_string_literal: true

# This file is responsible for loading all configuration files.

require 'pry'

require_relative './environment_variables'
require_relative './database'
require_relative './models'
require_relative './i18n'
require_relative './dry_rb'

# Require all files in app folder.
Dir['./app/**/**/*.rb'].sort.each { |f| require f }

require_relative './logger'