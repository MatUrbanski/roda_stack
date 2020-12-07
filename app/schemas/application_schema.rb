# frozen_string_literal: true

# {ApplicationSchema} is base class that contains configuration
# that is used across all schema validator classes inside the application.
class ApplicationSchema
  # @param [Hash] Parameters that've beeen passed to the endpoint.
  def initialize(params)
    @params = params
  end

  # It checks if passed params are valid base on ValidationSchema.
  # If params are invalid {InvalidParamsError} is raised.
  # When params are valid it returns provided params
  # @return [Hash] Hash when provided params are valid.
  # @return [InvalidParamsError] {InvalidParamsError} when provided params are not valid.
  def permit!
    schema = self.class::ValidationSchema.call(@params)

    raise(InvalidParamsError.new(schema.errors.to_h, I18n.t('invalid_parameters'))) if schema.errors.any?

    schema.to_h
  end
end
