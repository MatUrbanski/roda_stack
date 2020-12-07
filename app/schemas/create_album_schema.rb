# frozen_string_literal: true

class CreateAlbumSchema < ApplicationSchema
  ValidationSchema =
    Dry::Schema.Params do
      required(:email).filled(:string)
    end

  public_constant :ValidationSchema
end
