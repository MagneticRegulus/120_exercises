class GuessingGame
  def initialize(min=1, max=100)
    @range = (min..max)
  end

  def play
    reset
    loop do
      display_guesses
      prompt_guess
      break if win? || out_of_guesses?
      display_high_or_low
    end
    display_end_result
  end

  private

  attr_reader :number, :guesses, :range, :current_guess

  def random_number
    rand(range)
  end

  def set_max_guesses
    @guesses = Math.log2(range.size).to_i + 1
  end

  def set_number
    @number = random_number
  end

  def win?
    current_guess == number
  end

  def high_or_low
    case
    when current_guess > number  then :high
    when current_guess < number  then :low
    end
  end

  def out_of_guesses?
    guesses <= 0
  end

  def update_guesses
    @guesses -= 1
  end

  def display_guesses
    puts "You have #{guesses} guesses remaining."
  end

  def prompt_guess
    @current_guess = nil
    puts "Enter a number between #{range.first} and #{range.last}:"

    loop do
      @current_guess = gets.chomp.to_i
      break if range.include?(current_guess)
      puts "Invalid guess. Enter a number between #{range.first} and #{range.last}:"
    end

    update_guesses
    clear_screen
  end

  def display_high_or_low
    puts "Your guess is too #{high_or_low}."
  end

  def display_end_result
    if win?
      puts 'You win!'
    else
      puts 'You are out of guesses. You lose.'
    end
  end

  def clear_screen
    system 'clear'
  end

  def reset
    set_max_guesses
    set_number
    clear_screen
  end
end

game = GuessingGame.new(501, 1500)
game.play
puts ""
puts "Press any key to play again."
a = gets
game.play

puts ""
puts "Press any key to play again."
a = gets

game = GuessingGame.new(25, 75)
game.play
puts ""
puts "Press any key to play again."
a = gets
game.play

puts ""
puts "Press any key to play again."
a = gets

game = GuessingGame.new
game.play
