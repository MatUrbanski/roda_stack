# frozen_string_literal: true

# This contains setup for Ruby internationalization and localization (i18n).

require 'I18n'

I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
