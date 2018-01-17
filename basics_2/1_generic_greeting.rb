=begin
Modify the following code so that Hello! I'm a cat! is printed when
Cat.generic_greeting is invoked.

class Cat
end

Cat.generic_greeting
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further Exploration

kitty = Cat.new
kitty.class.generic_greeting

# kitty.class => Cat (which is an object)
# calling the method on the return of kitty.class is the same as
# Cat.generic_greeting because we can chain methods in Ruby. The first part
# return the Cat class and we can call the method on this class
