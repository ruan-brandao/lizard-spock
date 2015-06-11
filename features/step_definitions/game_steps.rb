When /^I start a new game$/ do
  run_interactive("lizard-spock")
end

Then /^the game shows the message:$/ do |text|
  assert_partial_output(text, all_output)
end
