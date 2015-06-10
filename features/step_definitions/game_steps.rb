When /^I start a new game$/ do
  game = Game.new
  game.start
end

Then /^the game shows the message:$/ do |text|
  pending
end
