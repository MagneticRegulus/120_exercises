class Pet
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "My #{self.class.to_s.downcase}, #{name}, is #{age} years old"
  end
end

class Cat < Pet
  attr_reader :coat

  def initialize(name, age, coat)
    @coat = coat
    super(name, age)
  end

  def to_s
    super + " and has #{coat} fur"
  end
end

class Dog < Pet; end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
sparky = Dog.new('Sparky', 3)
puts pudding, butterscotch, sparky

# Expected Output
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.
