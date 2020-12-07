# frozen_string_literal: true

# InvalidParamsError is an error which is raised when invalid params are passed to the endpoint.
class InvalidParamsError < StandardError
  attr_reader :object

  def initialize(object, message)
    @object = object

    super(message)
  end
end
