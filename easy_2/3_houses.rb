class House
  include Comparable # part of the ruby core library

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house) # added method
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# expected output
# Home 1 is cheaper
# Home 2 is more expensive


=begin
My orginal method:

def >(other_house) # added method
  price > other_house.price
end

You might want to compare houses based on other factors like the square meterage
or property area or even number of rooms. I think using the Comparable module
works well for classes which have 1 clear way to compare them. For example,
comparing point values for players in a game. 
=end
