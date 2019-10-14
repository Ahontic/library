require './modules/base.rb'
# defining Book class
class Book < Base
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate(title, author)
  end

  private

  def validate(title, author)
    validate_class(title, String)
    validate_empty(title)
    validate_class(author, Author)
  end
end
