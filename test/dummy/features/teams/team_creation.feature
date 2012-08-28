@team @creation
Feature: Team creation

	In order to have teams that will participate in a tournament
	As a Web Manager, Administrator or Root user
	I want to be able to create a team constituted by athletes, coaches and referees

	Background:     
		#Given I am authenticated
		#And My user role is 
		#       |  Web Manager  |
		#       | Administrator |
		#       |     Root      |
		Given the following federations exist in the system
			| AAUM |
			| AACM |
		And I am at the team creation page


	Scenario: Create a team successfully

		I should be able to create a new team

		When I fill in all fields for a team
		And I submit that data
		Then I should see a success message
		And The new team should be stored in the database
		And I should be redirected to that team's view page


	Scenario Outline: Create team with required field not filled in

		I should be notified if I try to create a new team
		without filling in all the required fields

		When I leave the <field> of the team blank
		And I submit that data
		Then I should see an error message
		And I should stay at the team's creation page
		And All fields filled in before trying to submit the team with the <field> blank should remain as they were
		Examples:
			| field			|
			| name			|
			| federation	|
			#| athlete		|
