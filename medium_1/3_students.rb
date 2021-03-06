=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. Some details for
these classes are missing. Make changes to the classes below so that the following
requirements are fulfilled:

1. Graduate students have the option to use on-campus parking, while Undergraduate
students do not.

2. Graduate and Undergraduate students have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.
=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  # added a super to the initialize method, but I have removed entirely as is redundant
end
