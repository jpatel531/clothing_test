Feature: As a user
	I can remove a product from my shopping cart

	Background:
		Given there are products
		And I am on the homepage
		And I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"

	@javascript
	Scenario: removing an item
		Given when I go onto my cart page
		And I click to remove "Almond Toe Court Shoes, Patent Black"
		Then I should no longer see "Almond Toe Court Shoes, Patent Black" in my cart