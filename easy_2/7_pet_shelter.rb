module PetTracker
  def number_of_pets
    pets.size
  end

  def print_pets
    pets.each { |pet| puts pet }
  end
end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  include PetTracker

  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def to_s
    name
  end
end

class Shelter
  include PetTracker

  attr_reader :adopters, :pets

  def initialize
    @adopters = []
    @pets = []
  end

  def new_arrival(pet)
    pets << pet
  end

  def validate_pet(pet)
    raise("#{pet.name} is not at the shelter.") if !pets.include?(pet)
  end

  def adopt(owner, pet)
    begin
      validate_pet(pet)
      owner.pets << pets.delete(pet)
      adopters << owner unless adopters.include?(owner)
    rescue RuntimeError => e
      puts e.message
    end
  end

  def print_adoptions
    adopters.each do |owner|
      puts "#{owner} has adopted the following pets:"
      owner.print_pets
    end
  end

  def print_available_pets
    puts "The Animal Shelter has the following unadopted pets:"
    print_pets
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
skippy       = Pet.new('hamster', 'Skippy')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.new_arrival(butterscotch)
shelter.new_arrival(pudding)
shelter.new_arrival(darwin)
shelter.new_arrival(kennedy)
shelter.new_arrival(sweetie)
shelter.new_arrival(molly)
shelter.new_arrival(chester)
shelter.new_arrival(asta)
shelter.new_arrival(laddie)
shelter.new_arrival(fluffy)
shelter.new_arrival(kat)
shelter.new_arrival(ben)
shelter.new_arrival(chatterbox)
shelter.new_arrival(bluebell)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(phanson, skippy) # Should through error which is rescued
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
shelter.print_available_pets
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.number_of_pets} unadopted pets."

=begin
Expected output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
=end
