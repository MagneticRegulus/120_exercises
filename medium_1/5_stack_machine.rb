class Minilang
  def initialize(program)
    @stack = Array.new
    @register = 0
    @program = decode(program)
  end

  def eval
    begin
      program.each { |cmd| read(cmd) }
    rescue TypeError => e
      puts e.message
    rescue NoMethodError => e
      puts e.message
    end
    puts ""
  end

  public

  attr_reader :stack, :register, :program

  def string_is_integer?(str)
    str == str.to_i.to_s
  end

  def decode(prog)
    prog.split.map(&:downcase)
  end

  def read(cmd)
    if string_is_integer?(cmd)
      @register = cmd.to_i
    else
      validate_command(cmd)
      self.send(cmd)
    end
  end

  def push
    stack << register
  end

  def pop
    validate_stack
    @register = stack.pop
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def print
    p register
  end

  def validate_stack
    raise(TypeError, 'Empty stack!') if stack.empty?
  end

  def validate_command(cmd)
    unless self.class.instance_methods.include?(cmd.to_sym)
      raise(NoMethodError, "Invalid token: #{cmd.upcase}.")
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
