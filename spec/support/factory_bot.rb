# frozen_string_literal: true

# This file contains configuration for FactoryBot gem.

FactoryBot.define do
  to_create(&:save)
end

FactoryBot.use_parent_strategy = false
