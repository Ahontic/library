# Validation module
module Validation
  NotFoundSuchEntity = Class.new(ArgumentError)

  def validate_empty(value)
    raise ArgumentError, 'Value cannot be blank' if value.empty?
  end

  def validate_class(value, value_class)
    raise TypeError, 'Incorrect type of data' unless value.is_a?(value_class)
  end
end
