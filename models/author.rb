# defining Author class
# class Author < Base
class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
    # validate
  end
end
