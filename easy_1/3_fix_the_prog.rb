class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Used attr_reader because the author and title of a book is static; there would
# almost ever be a reason to reset these instance variables unless the either
# the title or author is incorrect.

# advantage to using manually create getter methods would be to do something extra
# perhaps we always want the book's title to be enclosed in quotes, this could be
# set in a manual setter method. In this example, the attr_reader works well
# as other developers can clearly see that there is no intention to reset or
# alter the appearance of either ivar.
