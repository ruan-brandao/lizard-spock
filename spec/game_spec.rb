require "spec_helper"
require "game"

describe Game do
  let(:ui) { double("ui").as_null_object }

  subject(:game) { Game.new(ui) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!"
      expect(ui).to receive(:write).with(initial_message)

      game.start
    end

    it "sets the game status as :started" do
      game.start

      expect(game.status).to eq(:started)
    end

    it "chooses a hand shape" do
      expect(game).to receive(:choose_shape)

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

  describe "#next_step" do
    it "prompts the player if the player shape is not defined" do
      allow(game).to receive(:player_shape).and_return(nil)
      prompt = "Choose rock, paper, scissors, lizard or spock"

      expect(ui).to receive(:write).with(prompt)

      game.next_step
    end

    context "the player types 'end'" do
      before { allow(ui).to receive(:read).and_return("end") }

      it "shows the goodbye message" do
        goodbye_message = "Bye bye!"

        expect(ui).to receive(:write).with(goodbye_message)

        game.next_step
      end

      it "finishes the game" do
      expect(game).to receive(:finish)

      game.next_step
      end
    end

    context "the player chooses a valid shape" do
      before do
        index = rand(5)
        @player_input = Game::SHAPES[index].to_s
        allow(ui).to receive(:read).and_return(@player_input)
      end

      it "sets the player shape chosen by the player" do
        game.next_step

        expect(game.player_shape).to eq(@player_input.to_sym)
      end

      it "executes the game matchup" do
        expect(game).to receive(:matchup)

        game.next_step
      end

      it "shows the result" do
        expect(game).to receive(:show_result)

        game.next_step
      end
    end

    context "the player types an invalid word" do
      before { allow(ui).to receive(:read).and_return("abcde") }

      it "shows an error message" do
        error_message = "I didn't understand that. Choose again."

        expect(ui).to receive(:write).with(error_message)

        game.next_step
      end

      it "prompts the user again" do
        expect(game).to receive(:next_step).and_return(nil)

        game.next_step
      end
    end
  end

  describe "#finish" do
    it "sets the game status as :finished" do
      game.finish

      expect(game.status).to eq(:finished)
    end
  end

  describe "#matchup" do
    describe "calculates the result of the game" do
      it "draws the game when the player shape is equal to the game shape" do
        index = rand(5)
        allow(game).to receive(:shape).and_return(Game::SHAPES[index])
        allow(game).to receive(:player_shape).and_return(Game::SHAPES[index])

        game.matchup

        expect(game.result).to eq(:draw)
      end

      context "player chooses rock" do
        before do
          allow(game).to receive(:player_shape).and_return(:rock)
        end

        it "sets result as :player_wins if the game chooses scissors" do
          allow(game).to receive(:shape).and_return(:scissors)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :player_wins if the game chooses lizard" do
          allow(game).to receive(:shape).and_return(:lizard)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :game_wins if the game chooses paper" do
          allow(game).to receive(:shape).and_return(:paper)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end

        it "sets result as :game_wins if the game chooses spock" do
          allow(game).to receive(:shape).and_return(:spock)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end
      end

      context "player chooses paper" do
        before do
          allow(game).to receive(:player_shape).and_return(:paper)
        end

        it "sets result as :player_wins if the game chooses rock" do
          allow(game).to receive(:shape).and_return(:rock)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :player_wins if the game chooses spock" do
          allow(game).to receive(:shape).and_return(:spock)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :game_wins if the game chooses scissors" do
          allow(game).to receive(:shape).and_return(:scissors)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end

        it "sets result as :game_wins if the game chooses lizard" do
          allow(game).to receive(:shape).and_return(:lizard)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end
      end

      context "player chooses scissors" do
        before do
          allow(game).to receive(:player_shape).and_return(:scissors)
        end

        it "sets result as :player_wins if the game chooses paper" do
          allow(game).to receive(:shape).and_return(:paper)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :player_wins if the game chooses lizard" do
          allow(game).to receive(:shape).and_return(:lizard)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :game_wins if the game chooses rock" do
          allow(game).to receive(:shape).and_return(:rock)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end

        it "sets result as :game_wins if the game chooses spock" do
          allow(game).to receive(:shape).and_return(:spock)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end
      end

      context "player chooses lizard" do
        before do
          allow(game).to receive(:player_shape).and_return(:lizard)
        end

        it "sets result as :player_wins if the game chooses paper" do
          allow(game).to receive(:shape).and_return(:paper)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :player_wins if the game chooses spock" do
          allow(game).to receive(:shape).and_return(:spock)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :game_wins if the game chooses rock" do
          allow(game).to receive(:shape).and_return(:rock)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end

        it "sets result as :game_wins if the game chooses scissors" do
          allow(game).to receive(:shape).and_return(:scissors)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end
      end

      context "player chooses spock" do
        before do
          allow(game).to receive(:player_shape).and_return(:spock)
        end

        it "sets result as :player_wins if the game chooses rock" do
          allow(game).to receive(:shape).and_return(:rock)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :player_wins if the game chooses scissors" do
          allow(game).to receive(:shape).and_return(:scissors)

          game.matchup

          expect(game.result).to eq(:player_wins)
        end

        it "sets result as :game_wins if the game chooses paper" do
          allow(game).to receive(:shape).and_return(:paper)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end

        it "sets result as :game_wins if the game chooses lizard" do
          allow(game).to receive(:shape).and_return(:lizard)

          game.matchup

          expect(game.result).to eq(:game_wins)
        end
      end
    end
  end
end
