Feature: Start Game
  In order to have fun
  As a player
  I want to start the game

  Scenario: Start new game with success
    The game shows the initial message to the player when it is started.

    When I start a new game
    Then the game shows the message:
    """
    Welcome to the Rock, Paper, Scissors, Lizard, Spock Game!
    """
