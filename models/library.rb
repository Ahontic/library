# defining Library class
class Library < Base
  include Storage
  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def <<(entity)
    case entity
    when Author then add_author(entity)
    when Book then add_book(entity)
    when Order then add_order(entity)
    when Reader then add_reader(entity)
    else raise NotFoundSuchEntity
    end
  end

  def top_readers(quantity = 1)
    orders_by_reader = @orders.group_by(&:reader).transform_values(&:count)
    orders_by_reader.sort_by { |_reader, times| -times }.first(quantity)
  end

  def most_popular_books(quantity = 1)
    orders_by_book = @orders.group_by(&:book).transform_values(&:count)
    orders_by_book.sort_by { |_book, times| -times }.first(quantity).to_h.keys
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    orders_by_book = @orders.group_by(&:book)
    readers = []
    most_popular_books(quantity).each do |book|
      orders_by_book[book].each do |order|
        readers << order.reader
      end
    end
    readers.uniq.count
  end

  def to_yaml
    {
      authors: @authors,
      books: @books,
      orders: @orders,
      readers: @readers
    }.to_yaml
  end

  private

  def add_author(author)
    @authors << author
  end

  def add_book(book)
    @books << book
  end

  def add_order(order)
    @orders << order
  end

  def add_reader(reader)
    @readers << reader
  end
end
