class CliUi
  def write(text)
    puts text
  end

  def read
    user_input = gets.chomp
    user_input
  end
end
