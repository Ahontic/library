# defining Author class
class Author #< Base
  attr_reader :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
    #validate
  end

  
end
