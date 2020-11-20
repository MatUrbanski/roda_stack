# frozen_string_literal: true

require_relative './config/models'
require 'roda'

# The main class for Roda Application.
class App < Roda
  plugin :heartbeat
end
