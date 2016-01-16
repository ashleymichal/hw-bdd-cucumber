Feature: movies should appear in alphabetical order, not added order

Scenario: view movie list after adding movie

	Given that I have added "Zorro" with rating "PG-13"
	And I have added "Apocalypse Now" with rating "R"
	When I go to the RottenPotatoes home page sorted by "Movie Title"
	Then I should see "Apocalypse Now" before "Zorro" 