Feature: As a user
	I can apply a voucher to my shopping cart

	Background:
		Given there are products
		And I am on the homepage

	@javascript
	Scenario: £5 off order discount
		Given I click "Add To Cart" on a product
		And when I go onto my cart page
		And I select "£5 off your order" from the voucher dropdown
		Then my total should be decreased by £5