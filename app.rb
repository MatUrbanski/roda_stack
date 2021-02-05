# frozen_string_literal: true

require 'roda'

require_relative './system/boot'

# The main class for Roda Application.
class App < Roda
  # The environments plugin adds a environment class accessor to get the environment for the application,
  # 3 predicate class methods to check for the current environment (development?, test? and production?),
  # and a class configure method that takes environment(s) and yields to the block if the given environment(s)
  # match the current environment.
  plugin :environments

  # The heartbeat handles heartbeat/status requests.
  # If a request for the heartbeat path comes in, a 200 response with a text/plain
  # Content-Type and a body of 'OK' will be returned.
  # The default heartbeat path is '/heartbeat'.
  plugin :heartbeat

  configure :development, :production do
    # A powerful logger for Roda with a few tricks up it's sleeve.
    plugin :enhanced_logger
  end

  # The error_handler plugin adds an error handler to the routing,
  # so that if routing the request raises an error,
  # a nice error message page can be returned to the user.
  plugin :error_handler do |e|
    if e.instance_of?(Exceptions::InvalidParamsError)
      error_object    = e.object
      response.status = 422
    elsif e.instance_of?(ActiveSupport::MessageVerifier::InvalidSignature) ||
          e.instance_of?(Exceptions::InvalidAuthorizationToken) ||
          e.instance_of?(Exceptions::InvalidRefreshToken)

      error_object    = { error: I18n.t('invalid_authorization_token') }
      response.status = 401
    else
      error_object    = { error: I18n.t('something_went_wrong') }
      response.status = 500
    end

    response.write(error_object.to_json)
  end

  # The default_headers plugin accepts a hash of headers, and overrides
  # the default_headers method in the response class to be a copy of the headers.
  # Note that when using this module, you should not attempt to mutate of the values set in the default headers hash.
  plugin :default_headers,
         'Content-Type' => 'application/json',
         'Strict-Transport-Security' => 'max-age=16070400;',
         'X-Frame-Options' => 'deny',
         'X-Content-Type-Options' => 'nosniff',
         'X-XSS-Protection' => '1; mode=block'

  # The all_verbs plugin adds methods for http verbs other than get and post. The following verbs are added,
  # assuming rack handles them: delete, head, options, link, patch, put, trace, unlink.
  # These methods operate just like Roda's default get and post methods, so using them without any arguments
  # just checks for the request method, while using them with any arguments also checks that the arguments match the full path.
  plugin :all_verbs
end
