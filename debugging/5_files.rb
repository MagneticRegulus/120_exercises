=begin
You started writing a very basic class for handling files, with a simple test that checks whether copying a file works correctly. So far everything looks fine.

As soon as a colleague of yours starts using your class, she complains that it sometimes throws a NameError, telling her that there's an uninitialized constant File::FORMAT.

What is the problem and what are possible ways to fix it?

Teh `File#to_s` method looks for a constant called FORMAT. This constant is set at an individual subclass level. As there is no FORMAT constant initialized at the superclass level, it throws an error. To fix this, we need the method to look at the calling object's class first (which will be a subclass) and then look for the FORMAT constant within that class, not the File class.
=end

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}" # look for constant base on subclass
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true
puts blog_post
puts copy_of_blog_post
