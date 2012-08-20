@team @management
Feature: Team management

	In order to have all the team's information correct
	As a Web Manager, Administrator or Root user
	I want to be able to edit, delete an existing team

	Background:     
		#Given I am authenticated
		#And My user role is 
		#       |  Web Manager  |
		#       | Administrator |
		#       |     Root      |
		Given there exists the following federations in the system
			| AAUM |
			| AAUC |

	Scenario: Edit successfully a team

		I should be able to edit an existing team

		Given I am at a team's edit page
		When I edit the team's name
		And I submit the changes
		Then I should see a success message
		And The team data should be stored in the database
		And I should be redirected to that team's view page

	Scenario Outline: Edit a team with a required field not filled in

		I should be notified if I try to edit a team
		with a required field not filled in

		Given I am at a team's edit page
		When I clean the <field> of the team
		And I submit the changes
		Then I should see an error message 
		And I should stay at the team's edit page
		And All fields filled in before trying to submit the team with the <field> blank should remain as they were
		Examples:
			| field     	|
			| name 	    	|
			| federation	|
			# | athlete		|

	Scenario: Delete successfully an team

		I should be able to delete an existing team

		Given I am at the team's index page
		When I click the delete button
		And I confirm that decision
		Then The deleted team shouldn't be listed
		And I should be redirected to the teams' index page
