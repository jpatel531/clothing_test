Feature: As a user I should be able to see a list of products

	@javascript
	Scenario: product lists
		Given there are products
		And I am on the homepage
		Then I should be able to see the appropriate list of products