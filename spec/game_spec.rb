require "spec_helper"
require "game"

describe Game do
  let(:output) { double("output") }

  subject(:game) { Game.new(output) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
      expect(output).to receive(:puts).with(initial_message)

      game.start
    end
  end
end
