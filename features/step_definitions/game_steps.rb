When /^I start a new game$/ do
  start_game
end

Then /^the game shows the message:$/ do |text|
  assert_partial_output(text, all_output)
end

And /^chooses a hand shape$/ do
  expect(@game.shape).to_not be_nil
end

Given /^the game is started$/ do
  start_game
end

And /^I finish the game$/ do
  type("end")
end

Given /^the game has chosen "([^"]*)"$/ do |game_shape|
  @game.shape = game_shape
end

When /^I choose "([^"]*)"$/ do |player_shape|
  type(player_shape)
  @game.player_shape = player_shape
end

Then /^I should "([^"]*)" the game$/ do |result|
  assert_partial_output(result, all_output)
end
