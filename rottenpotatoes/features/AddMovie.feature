Feature: User can manually add movie

Background: Start from RottenPotatoes home page

	Given I am on the RottenPotatoes home page
	When I follow "Add new movie"
	Then I should be on the Create New Movie page

Scenario: Add a movie (happy path)

	When I fill in "Title" with "Men In Black"
	And I select "PG-13" from "Rating"
	And I press "Save Changes"
	Then I should be on the details page for "Men In Black"
	And I should see "Men In Black"

Scenario: Leave title blank (sad path)
	
	When I fill in "Title" with ""
	When I select "PG-13" from "Rating"
	And I press "Save Changes"
	Then I should be on the Create New Movie page