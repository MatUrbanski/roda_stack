# frozen_string_literal: true

require_relative './config/database'
require 'logger'

migrate =
  lambda do |version|
    Sequel.extension(:migration)
    DB.loggers << Logger.new($stdout) if DB.loggers.empty?
    Sequel::Migrator.apply(DB, 'db/migrate', version)

    # Dump database schema after migration.
    Rake::Task['db:dump'].invoke
  end

namespace :db do
  desc 'migrate up'
  task :migrate do
    migrate.call(nil)
  end

  desc 'migrate all the way to 0'
  task :down, [:version] do |_, args|
    version = Integer((args[:version] || 0), 10)
    migrate.call(version)
  end

  desc 'rollback version'
  task :rollback do |_, _args|
    current_version = DB.fetch('SELECT * FROM schema_info').first[:version]
    migrate.call(current_version - 1)
  end

  desc 'dump to file'
  task :dump do
    # Dump database schema only in development environment.
    sh %(sequel -D #{DB.url} > db/schema.rb) if ENV['RACK_ENV'] == 'development'
  end
end
