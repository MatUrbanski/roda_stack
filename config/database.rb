# frozen_string_literal: true

# This file contain code to setup the database connection.

require_relative './environment_variables'
require 'sequel/core'

# Delete DATABASE_URL from the environment, so it isn't accidently passed to subprocesses.
DB = Sequel.connect(ENV.delete('DATABASE_URL'))
