# frozen_string_literal: true

require_relative './environment_variables'
require 'sequel/core'

# Delete DATABASE_URL from the environment, so it isn't accidently passed to subprocesses.
DB = Sequel.connect(ENV.delete('DATABASE_URL'))
