Feature: As a user I am unable to add Out of Stock products to my cart

	Background: I am on the homepage
		Given I am on the homepage

	@javascript
	Scenario: attempting to add an out of stock product
		When I click "Add To Cart" on "Flip Flops, Blue"
		Then I should be told that I cannot add this product
		And the number of products in my cart should not change
		When I go onto my cart page
		Then I should not see "Flip Flops, Blue" in my cart

