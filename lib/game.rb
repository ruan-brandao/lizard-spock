class Game
  SHAPES = [:rock, :paper, :scissors, :lizard, :spock]
  attr_reader :shape, :status

  def initialize(ui = CliUi.new)
    @ui = ui
  end

  def start
    initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
    @ui.write initial_message

    @status = :started

    choose_shape
  end

  def choose_shape
    index = Kernel.rand(5)
    @shape = SHAPES[index]
  end
end
