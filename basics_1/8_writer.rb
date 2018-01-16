=begin
Using the code from the previous exercise, add a setter method named #name. Then,
rename kitty to 'Luna' and invoke #greet again.
=end

class Cat
  attr_accessor :name # conbined getter and setter
  # or just attr_writer

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet


# Or

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
