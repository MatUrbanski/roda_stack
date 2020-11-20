# frozen_string_literal: true

require_relative './config/models'
require_relative 'app'
require 'rack/unreloader'

development = ENV['RACK_ENV'] == 'development'

Unreloader = Rack::Unreloader.new(subclasses: %w[Roda Sequel::Model], reload: development) { App }

Unreloader.require('app.rb') { 'App' }
run(development ? Unreloader : App.freeze.app)
