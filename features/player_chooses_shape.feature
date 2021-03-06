Feature: Player chooses shape
  After starting the game, the player chooses a hand shape for playing.

  Scenario: Prompt to choose shape
    Given the game is started
    And I finish the game
    Then the game shows the message:
    """
    Choose rock, paper, scissors, lizard or spock
    """

  @wip
  Scenario Outline: Game matchup
    Given the game has chosen "<game_shape>"
    When I choose "<player_shape>"
    Then I should "<result>" the game

    Scenarios:
    | game_shape | player_shape | result |
    | rock       | rock         | draw   |
    | rock       | paper        | win    |
    | rock       | scissors     | lose   |
    | rock       | lizard       | lose   |
    | rock       | spock        | win    |
    | paper      | rock         | lose   |
    | paper      | paper        | draw   |
    | paper      | scissors     | win    |
    | paper      | lizard       | win    |
    | paper      | spock        | lose   |
    | scissors   | rock         | win    |
    | scissors   | paper        | lose   |
    | scissors   | scissors     | draw   |
    | scissors   | lizard       | lose   |
    | scissors   | spock        | win    |
    | lizard     | rock         | win    |
    | lizard     | paper        | lose   |
    | lizard     | scissors     | win    |
    | lizard     | lizard       | draw   |
    | lizard     | spock        | lose   |
    | spock      | rock         | lose   |
    | spock      | paper        | win    |
    | spock      | scissors     | lose   |
    | spock      | lizard       | win    |
    | spock      | spock        | draw   |
