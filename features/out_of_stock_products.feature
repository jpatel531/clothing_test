@javascript
Feature: As a user
	I am unable to add Out of Stock products to my cart

	Background: 
		Given there are products
		And I am on the homepage

	Scenario: attempting to add an out of stock product
		Given I click "Add To Cart" on "Flip Flops, Blue"
		Then I should be told that I cannot add this product
		And the number of products in my cart should not change
		And when I go onto my cart page
		Then I should not see "Flip Flops, Blue" in my cart

