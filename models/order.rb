# defining Order class
class Order < Base
  attr_reader :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = date
    validate(book, reader, date)
  end

  private

  def validate(book, reader, date)
    validate_class(book, Book)
    validate_class(reader, Reader)
    validate_class(date, Date)
  end
end
