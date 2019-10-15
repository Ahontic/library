# defining Author class
class Author < Base
  attr_reader :name, :biography

  def initialize(name, biography = '')
    @name = name
    @biography = biography
    validate(name)
  end

  private

  def validate(name)
    validate_class(name, String)
    validate_empty(name)
  end
end
