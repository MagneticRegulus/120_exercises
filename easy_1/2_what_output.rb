class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s # surprised that this still points to the same obj
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

#original code outputs the following:
# Fluffy
# My name is FLUFFY.
# FLUFFY
# FLUFFY
# the #upcase! method has altered the instance variable for good.
# to avoid this, the non-destructive alternative for this method should be used
# in interpolation

# as a dev, I would however, assume that the dev really wanted to capitalize
# this name.

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# the instance variable Pet@name is stored as a *different* obj.
# the local vairable is ressasigned to 43, but not the instance var.
