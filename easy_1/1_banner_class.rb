class Banner
  def initialize(message, width=nil)
    @message = message
    @msg_length = message.length
    @width = width.nil? || width < @msg_length ? @msg_length : width
    @padding = (@width - @msg_length)
    reset_width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def reset_width
    @width -= 1 if @padding.odd?
    @width = @msg_length if @padding.zero?
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    msg_pad = @padding / 2
    "| #{' ' * msg_pad}#{@message}#{' ' * msg_pad} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
puts ''
banner = Banner.new('')
puts banner
banner = Banner.new('Hello', 7)
puts banner
banner = Banner.new('Hello', 3)
puts banner
banner = Banner.new('Hello', 11)
puts banner

# Works as I would like, but not very elegant
