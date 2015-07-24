class Game
  SHAPES = [:rock, :paper, :scissors, :lizard, :spock]
  attr_reader :shape, :player_shape, :status, :result

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

  def next_step
    if @player_shape.nil?
      prompt = "Choose rock, paper, scissors, lizard or spock"
      @ui.write prompt
    end

    player_input = @ui.read.downcase
    case player_input
    when "end"
      goodbye_message = "Bye bye!"
      @ui.write(goodbye_message)
      finish
    when /rock|paper|scissors|lizard|spock/
      @player_shape = player_input.to_sym
      matchup
      show_result
      finish
    else
      error_message = "I didn't understand that. Choose again."
      @ui.write error_message
      nil
    end
  end

  def matchup
    if self.shape == self.player_shape
      @result = :draw
    else
      case self.player_shape
      when :rock
        @result = (self.shape == :scissors || self.shape == :lizard) ? :player_wins : :game_wins
      when :paper
        @result = (self.shape == :rock || self.shape == :spock) ? :player_wins : :game_wins
      when :scissors
        @result = (self.shape == :paper || self.shape == :lizard) ? :player_wins : :game_wins
      when :lizard
        @result = (self.shape == :paper || self.shape == :spock) ? :player_wins : :game_wins
      when :spock
        @result = (self.shape == :rock || self.shape == :scissors) ? :player_wins : :game_wins
      end
    end
  end

  def show_result
  end

  def finish
    @status = :finished
  end
end
