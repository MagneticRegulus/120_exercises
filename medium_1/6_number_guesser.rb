class GuessingGame
  def initialize
    @range = (MIN_NUM..MAX_NUM)
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

  MIN_NUM = 1
  MAX_NUM = 100
  MAX_GUESSES = 7
  attr_reader :number, :guesses, :range, :current_guess

  def random_number
    rand(range)
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
    puts "Enter a number between #{MIN_NUM} and #{MAX_NUM}:"

    loop do
      @current_guess = gets.chomp.to_i
      break if range.include?(current_guess)
      puts "Invalid guess. Enter a number between #{MIN_NUM} and #{MAX_NUM}:"
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
    @guesses = MAX_GUESSES
    @number = random_number
    clear_screen
  end
end

game = GuessingGame.new
game.play
puts ""
puts "Press any key to play again."
a = gets
game.play
