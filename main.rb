require './config.rb'
# Authors
author1 = Author.new('William Shakespeare', 'Born in prehistoric time...')
author2 = Author.new('Agatha Christie', 'Born and killed immediately...')

# Books
book1 = Book.new('Plays and poetry', author1)
book2 = Book.new('Fantastic Beasts and Where to Find Them', author2)

# Readers
reader1 = Reader.new('A', 'email1@rubygarage.org', 'Dnepr', 'Pine str', 1)
reader2 = Reader.new('B', 'email2rubygarage.org', 'Dnepr', 'Pike str', 2)

# Orders
order1 = Order.new(book1, reader1, Date.today)
order2 = Order.new(book2, reader1, Date.today)
order3 = Order.new(book1, reader2, Date.today)
order4 = Order.new(book2, reader2, Date.today)
order5 = Order.new(book1, reader1, Date.today)

# Creating new library
library = Library.new

# Adding authors to library
library << author1
library << author2

# Adding books to library
library << book1
library << book2

# Adding readers to library
library << reader1
library << reader2

# Adding orders to library
library << order1
library << order2
library << order3
library << order4
library << order5

top_readers = library.top_readers(2)
top_readers.each do |reader, count|
  puts "Reader #{reader.name} has bought #{count} books"
end

top_books = library.most_popular_books(2)
puts 'Most popular books: '
top_books.each do |book, _author|
  puts "Title: #{book.title}, Author: #{book.author.name}"
end

puts "Number of readers of the most popular book:
#{library.number_of_readers_of_the_most_popular_books(2)}"
library.save
