@javascript
Feature: As a user
	I can remove a product from my shopping cart

	Background:
		Given there are products
		And I am on the homepage
		And I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"

	Scenario: removing an item
		Given when I go onto my cart page
		And I click "Remove From Cart" on "Almond Toe Court Shoes, Patent Black"
		Then I should not see "Almond Toe Court Shoes, Patent Black" in my cart

	@this
	Scenario: removing only one instance of duplicate items
		Given I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And when I go onto my cart page
		And I click "Remove From Cart" on "Almond Toe Court Shoes, Patent Black"
		Then I should only see one less copy of "Almond Toe Court Shoes, Patent Black"