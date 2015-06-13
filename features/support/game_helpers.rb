module GameHelpers
  def set_shape
    game = Game.new
    game.start
    @shape = game.shape
  end
end

World(GameHelpers)
