# defining Library class
class Library
  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  # def <<(entity)
  #   case entity
  #   when Author then add_author(entity)
  #   when Book then add_author(entity)
  #   when Order then add_author(entity)
  #   when Reader then add_author(entity)
  #   else raise NotFoundSuchEntity
  #   end
  # end

  def top_readers(quantity = 1)
    
    @orders.group_by(&:reader).transform_values(&:count).sort_by{|k, v| v}.reverse.take(quantity)#
  
  end

  def most_popular_books(quantity = 1)
      @orders.group_by(&:book).transform_values(&:count).sort_by{|k, v| v}.reverse.take(quantity)
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)

     # @orders.group_by(&:book).transform_values(&:count).sort_by{|k, v| v}.reverse.take(quantity)
  end



  

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
