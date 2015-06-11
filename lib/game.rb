class Game
  SHAPES = [:rock, :paper, :scissors, :lizard, :spock]
  attr_reader :shape

  def initialize(output = STDOUT)
    @output = output
  end

  def start
    initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
    @output.puts initial_message
    choose_shape
  end

  def choose_shape
    index = Kernel.rand(5)
    @shape = SHAPES[index]
  end
end
