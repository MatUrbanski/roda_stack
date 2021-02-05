# frozen_string_literal: true

# This file contains logger configuration

Application.boot(:logger) do
  init do
    require 'logger'
  end

  start do
    # Define Logger instance.
    logger       = Logger.new($stdout)
    logger.level = Logger::WARN if Application.env == 'test'

    register(:logger, logger)
  end
end
