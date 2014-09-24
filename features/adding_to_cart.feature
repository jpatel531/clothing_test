Feature: As a user
	I can add a product to my shopping cart

	Background:
		Given there are products
		And I am on the homepage

	@javascript
	Scenario: adding a product to cart
		Given I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		Then the number of cart items should be incremented
		And when I go onto my cart page
		Then I should see that item in my shopping cart
		And I should see the total of my shopping cart