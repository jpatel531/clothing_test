@javascript
Feature: As a user I can apply a voucher to my shopping cart

	Background: I am on the homepage
		Given I am on the homepage

	Scenario: £5 off order discount
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And I go onto my cart page
		And I select "£5 off your order" from the voucher dropdown
		Then my total should be decreased by £5

	Scenario: £10 off when you spend over £50 applied correctly
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And I go onto my cart page
		And I select "£10 off when you spend over £50" from the voucher dropdown
		Then my total should be decreased by £10

	Scenario: £15 off when you have bought at least one footwear item and spent over £75
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And I go onto my cart page
		And I select "£15 off when you have bought at least one footwear item and spent over £75" from the voucher dropdown
		Then my total should be decreased by £15

	Scenario: user can apply multiple vouchers
		When I click "Add To Cart" on "Almond Toe Court Shoes, Patent Black"
		And I go onto my cart page
		And I select "£10 off when you spend over £50" from the voucher dropdown
		And I select "£15 off when you have bought at least one footwear item and spent over £75" from the voucher dropdown
		Then my total should be decreased by £25

	Scenario: applying the wrong voucher
		When I click "Add To Cart" on "Cotton Shorts, Medium Red"
		And I go onto my cart page
		And I select "£10 off when you spend over £50" from the voucher dropdown
		Then the total should not change
		And I should be alerted that I have selected an invalid voucher