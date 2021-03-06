Feature: Start Game
  In order to have fun
  As a player
  I want to start the game

  Scenario: Start new game with success
    The game shows the initial message to the player and chooses a random hand
    shape when it is started.

    When I start a new game
    And I finish the game
    Then the game shows the message:
    """
    Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!
    """
    And chooses a hand shape
