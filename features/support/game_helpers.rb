module GameHelpers
  def start_game
    run_interactive("lizard-spock")
    @game = Game.new
    @game.start
  end
end

World(GameHelpers)
