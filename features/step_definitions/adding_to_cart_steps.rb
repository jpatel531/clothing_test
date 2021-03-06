Given(/^I am on the homepage$/) do
	visit '/'
end

Given(/^I click "(.*?)" on "(.*?)"$/) do |arg1, arg2|
	@product = Product.find_by_name arg2
	until page.evaluate_script 'jQuery.active == 0'
		click_link "#{@product.id}"
	end
end


Then(/^the number of cart items should be incremented$/) do
	until page.evaluate_script 'jQuery.active == 0'
		within '.shopping-cart' do 
			expect(page).to have_content 1
		end
	end
end

Then(/^I go onto my cart page$/) do
	visit '/shopping_cart'
end

Then(/^I should see that item in my shopping cart$/) do
	until page.evaluate_script 'jQuery.active == 0'
		expect(page).to have_content "Almond Toe Court Shoes, Patent Black"
	end
end

Then(/^I should see the total of my shopping cart$/) do
	until page.evaluate_script 'jQuery.active == 0'
		expect(page).to have_content '£99.00'
	end
end

