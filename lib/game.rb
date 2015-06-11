class Game
  def initialize(output = STDOUT)
    @output = output
  end

  def start
    initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
    @output.puts initial_message
  end
end
