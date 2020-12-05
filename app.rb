# frozen_string_literal: true

require_relative './config/models'
require_relative './config/i18n'
require 'roda'

# The main class for Roda Application.
class App < Roda
  # The heartbeat handles heartbeat/status requests.
  # If a request for the heartbeat path comes in, a 200 response with a text/plain
  # Content-Type and a body of 'OK' will be returned.
  # The default heartbeat path is '/heartbeat'.
  plugin :heartbeat
end
