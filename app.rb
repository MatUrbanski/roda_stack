# frozen_string_literal: true

require 'roda'

require_relative './config/boot'

# The main class for Roda Application.
class App < Roda
  # The heartbeat handles heartbeat/status requests.
  # If a request for the heartbeat path comes in, a 200 response with a text/plain
  # Content-Type and a body of 'OK' will be returned.
  # The default heartbeat path is '/heartbeat'.
  plugin :heartbeat

  # The error_handler plugin adds an error handler to the routing,
  # so that if routing the request raises an error,
  # a nice error message page can be returned to the user.
  plugin :error_handler

  route do |r|
    r.on('albums') do
      r.is('recent') do
        r.get do
          CreateAlbumSchema.permit(r.params)
          'asd'
        end
      end
    end
  end
end
