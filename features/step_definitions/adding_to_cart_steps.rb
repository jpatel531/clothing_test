When(/^I am on the homepage$/) do
	visit '/'
end

Given(/^I click "(.*?)" on a product$/) do |arg1|
	click_link 'Add To Cart'
end

Then(/^I should be told to sign in$/) do
	expect(page).to have_content 'You must sign in before adding a product to cart'
end

