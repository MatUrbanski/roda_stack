# frozen_string_literal: true

Application.boot(:oj) do
  init do
    require 'oj'
  end

  start do
    # The :rails mode mimics the ActiveSupport version 5 encoder.
    # Rails and ActiveSupport are built around the use of the as_json(*) method defined for a class.
    # Oj attempts to provide the same functionality by being a drop in replacement with a few exceptions.
    # Rails includes more details on compatibility and use.
    Oj.default_options = { mode: :rails }
  end
end
