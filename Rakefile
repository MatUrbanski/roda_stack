# frozen_string_literal: true

# Rakefile contains all the application-related tasks.

require_relative './config/database'
require 'logger'

migrate =
  lambda do |version|
    # Enable Sequel migration extension.
    Sequel.extension(:migration)

    # Enable Database logger to see logs during migration launch.
    DB.loggers << Logger.new($stdout) if DB.loggers.empty?

    # Perform migrations based on migration files in a specified directory.
    Sequel::Migrator.apply(DB, 'db/migrate', version)

    # Dump database schema after migration.
    Rake::Task['db:dump'].invoke
  end

namespace :db do
  desc 'Migrate the database.'
  task :migrate do
    migrate.call(nil)
  end

  desc 'Rolling back to initial migration.'
  task :down, [:version] do |_, args|
    version = Integer((args[:version] || 0), 10)
    migrate.call(version)
  end

  desc 'Rolling back latest migration.'
  task :rollback do |_, _args|
    current_version = DB.fetch('SELECT * FROM schema_info').first[:version]
    migrate.call(current_version - 1)
  end

  desc 'Dump database schema to file.'
  task :dump do
    # Dump database schema only in development environment.
    sh %(sequel -D #{DB.url} > db/schema.rb) if ENV['RACK_ENV'] == 'development'
  end
end
