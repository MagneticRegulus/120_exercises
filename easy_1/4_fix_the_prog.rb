class Book
  attr_accessor :author, :title # added code

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

=begin
What do you think of this way of creating and initializing Book objects? (The two steps are separate.) Would it be better to create and initialize at the same time like in the previous exercise? What potential problems, if any, are introduced by separating the steps?

In general, I think it is better to create and initialize at the same time in case an uninitialized ivar is accessed before it's set. This would throw an error. In a more complicated program, it might be better to separate the steps if the obj needs to be created before its ivars are known.
=end
