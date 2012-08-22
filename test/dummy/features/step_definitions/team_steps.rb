
Given /^the following federations exist in the system$/ do |table|
  # table is a Cucumber::Ast::Table
  @board = table.raw
  @board.each { |fed_arr| fed_arr.each { |fed| Federation.create name:fed } }
end

Given /^I am at the team creation page$/ do
  visit play_futsal.new_team_path
end


When /^I fill in all fields for a team$/ do
  fill_in("Name", :with => "nametest")
  select("AAUM", {:from => "team_federation_id"})
end

When /^I submit that data$/ do
  click_button("Submit")
end

Then /^I should see a success message$/ do
  page.should have_content('successfully')
end

Then /^The new team should be stored in the database$/ do
  PlayFutsal::Team.count.should == 1
end

Then /^I should be redirected to that team's view page$/ do 
  current_path.should == play_futsal.team_path(PlayFutsal::Team.first)
end


When /^I leave the name of the team blank$/ do
  select("AAUM", {:from => "team_federation_id"})
end

Then /^I should see an error message$/ do
  page.should have_content('prohibited')
end

Then /^I should stay at the team's creation page$/ do
  current_path.should == play_futsal.teams_path
end

Then /^All fields filled in before trying to submit the team with the name blank should remain as they were$/ do
  find.field("Name").value.should == ""
  find.field("team_federation_id").value.should == "1" 
end


When /^I leave the federation of the team blank$/ do
  fill_in("Name", :with => "nametest")
end

Then /^All fields filled in before trying to submit the team with the name blank should remain as they were$/ do
  find.field("Name").value.should == "testname"
  find.field("team_federation_id").value.should == "" 
end
