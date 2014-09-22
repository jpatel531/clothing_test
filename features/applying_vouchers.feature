Feature: As a user
	I can apply a voucher to my shopping cart

	Background:
		Given there are products
		And I am on the homepage

	@javascript
	Scenario: £5 off order discount
		Given I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And when I go onto my cart page
		And I select "£5 off your order" from the voucher dropdown
		Then my total should be decreased by £5

	@javascript
	Scenario: £10 off when you spend over £50 applied correctly
		Given I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And when I go onto my cart page
		And I select "£10 off when you spend over £50" from the voucher dropdown
		Then my total should be decreased by £10

	@javascript
	Scenario: £15 off when you have bought at least one footwear item and spent over £75
		Given I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And when I go onto my cart page
		And I select "£15 off when you have bought at least one footwear item and spent over £75" from the voucher dropdown
		Then my total should be decreased by £15


	Scenario: applying the wrong voucher

	Scenario: applying the voucher twice

	Scenario: applying mulitple vouchers