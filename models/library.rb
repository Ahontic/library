require './modules/base.rb'
require './modules/file_options.rb'
# defining Library class
class Library < Base
  include FileOptions
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
    else raise NotFoundSuchEntity, 'Such entity was not found'
    end
  end

  def top_readers(quantity = 1)
    orders_by_reader = @orders.group_by(&:reader).transform_values(&:count)
    orders_by_reader.sort_by { |_k, v| v }.reverse.take(quantity)
  end

  def most_popular_books(quantity = 1)
    orders_by_book = @orders.group_by(&:book).transform_values(&:count)
    orders_by_book.sort_by { |_k, v| v }.reverse.take(quantity)
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    orders_by_book = @orders.group_by(&:book)
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
