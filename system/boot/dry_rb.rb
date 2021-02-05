# frozen_string_literal: true

# This file contains configuration for dry-rb toolset.

Application.boot(:dry_rb) do
  init do
    require 'dry-validation'
  end
end
