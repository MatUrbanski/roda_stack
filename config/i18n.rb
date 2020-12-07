# frozen_string_literal: true

# This file contains setup for Ruby internationalization and localization (i18n).

require 'i18n'

I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
