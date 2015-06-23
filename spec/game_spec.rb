require "spec_helper"
require "game"

describe Game do
  let(:output) { double("output").as_null_object }

  subject(:game) { Game.new(output) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
      expect(output).to receive(:puts).with(initial_message)

      game.start
    end

    it "chooses a hand shape" do
      expect(game).to receive(:choose_shape)

      game.start
    end

    it "prompts the user for choosing a hand shape" do
      prompt = "Choose rock, paper, scissors, lizard or spock"
      expect(output).to receive(:puts).with(prompt)

      game.start
    end
  end

  describe "#choose_shape" do
    it "sets the shape for game" do
      game.choose_shape

      expect(game.shape).to_not be_nil
    end

    it "chooses a valid shape" do
      valid_shapes = Game::SHAPES

      game.choose_shape

      expect(valid_shapes).to include(game.shape)
    end

    it "chooses the shape randomly" do
      allow(Kernel).to receive(:rand).and_return(3)

      game.choose_shape

      expect(game.shape).to eq(Game::SHAPES[3])
    end
  end
end
