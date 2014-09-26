Feature: As a user I can add a product to my shopping cart

	Background: I am on the homepage
		Given I am on the homepage

	@javascript
	Scenario: adding a product to cart
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		Then the number of cart items should be incremented
		When I go onto my cart page
		Then I should see that item in my shopping cart
		And I should see the total of my shopping cart