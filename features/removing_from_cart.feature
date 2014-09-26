Feature: As a user I can remove a product from my shopping cart

	@javascript
	Scenario: removing an item
		Given there are products
		And I am on the homepage
		And I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		When when I go onto my cart page
		And I click "Remove From Cart" on "Almond Toe Court Shoes, Patent Black"
		Then I should not see "Almond Toe Court Shoes, Patent Black" in my cart

	@javascript
	Scenario: removing only one instance of duplicate items
		Given there are products
		And I am on the homepage
		And I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And when I go onto my cart page
		And I click "Remove From Cart" on "Almond Toe Court Shoes, Patent Black"
		Then I should only see one less copy of "Almond Toe Court Shoes, Patent Black"