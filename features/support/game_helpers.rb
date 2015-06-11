module GameHelpers
  def set_shape
    @shape = Game.new.shape
  end
end

World(GameHelpers)
