=begin
Create a module named Transportation that contains three classes: Vehicle, Truck,
and Car. Truck and Car should both inherit from Vehicle.
=end

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

puts Transportation::Truck.ancestors
puts Truck.ancestors # does not work
