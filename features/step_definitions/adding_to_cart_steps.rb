Given(/^I am on the homepage$/) do
	visit '/'
end

Given(/^I click "(.*?)" on a product$/) do |arg1|
	@product = Product.find_by_name "Almond Toe Court Shoes, Patent Black"
	click_link "#{@product.id}"
end

Then(/^the number of cart items should be incremented$/) do
	within '.shopping-cart' do 
		expect(page).to have_content 1
	end
end

Then(/^when I go onto my cart page$/) do
	visit '/shopping_cart'
end

Then(/^I should see that item in my shopping cart$/) do
	expect(page).to have_content "Almond Toe Court Shoes, Patent Black"
end

# Then(/^I should speak troth$/) do
# 	expect(true).to be_falsey
# end
