Feature: As a user
	I should be able to see a list of products

	Background:
		Given there are products
		And I am on the homepage

	@javascript
	Scenario:
		Then I should be able to see the appropriate list of products