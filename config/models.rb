# frozen_string_literal: true

require_relative 'database'
require 'sequel/model'

# Whether association metadata should be cached in the association reflection.
# If not cached, it will be computed on demand.
# In general you only want to set this to false when using code reloading.
# When using code reloading, setting this will make sure that if an associated class is removed or modified,
# this class will not have a reference to the previous class.
Sequel::Model.cache_associations = false if ENV['RACK_ENV'] == 'development'

# The auto_validations plugin automatically sets up the following types of validations for your model columns:
# type validations for all columns
# not_null validations on NOT NULL columns (optionally, presence validations)
# unique validations on columns or sets of columns with unique indexes
# max length validations on string columns
Sequel::Model.plugin :auto_validations

# The prepared_statements plugin modifies the model to use prepared statements for instance level inserts and updates.
Sequel::Model.plugin :prepared_statements

# The subclasses plugin keeps track of all subclasses of the current model class.
# Direct subclasses are available via the subclasses method, and all descendent classes are available via the descendents method.
Sequel::Model.plugin :subclasses unless ENV['RACK_ENV'] == 'development'

unless defined?(Unreloader)
  require 'rack/unreloader'
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require('app/models') { |f| Sequel::Model.send(:camelize, File.basename(f).sub(/\.rb\z/, '')) }

if ENV['RACK_ENV'] == 'development' || ENV['RACK_ENV'] == 'test'
  require 'logger'
  LOGGER = Logger.new($stdout)
  LOGGER.level = Logger::FATAL if ENV['RACK_ENV'] == 'test'
  DB.loggers << LOGGER
end

unless ENV['RACK_ENV'] == 'development'
  # Freeze all descendent classes. This also finalizes the associations for those classes before freezing.
  Sequel::Model.freeze_descendents

  # Freeze internal data structures for the Database instance.
  DB.freeze
end
