Feature: As a user
	I can add a product to my shopping cart

	Background:
		When I am on the homepage

	Scenario: logged out
		Given I click "Add to Cart" on a product
		Then I should be told to sign in

	# Scenario: logged in
	# 	Given that I am logged in
	# 	And I click "Add To Cart" on a product
	# 	Then the number of cart items should be incremented
	# 	And I should see that item in my shopping cart