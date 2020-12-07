# frozen_string_literal: true

# ApplicationSchema is base class that contains configuration
# that is used across all schema validator clasess inside the application.
class ApplicationSchema
  def self.permit(params)
    schema = self::ValidationSchema.call(params)

    raise(InvalidParamsError.new(schema.errors.to_h, I18n.t('invalid_parameters'))) if schema.errors.any?

    schema
  end
end
