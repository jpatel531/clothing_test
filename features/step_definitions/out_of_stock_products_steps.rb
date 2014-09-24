Then(/^I should be told that I cannot add this product$/) do
	expect(page).to have_content "You cannot add a product that is out of stock to your cart"
end

Then(/^the number of products in my cart should not change$/) do
	within '.shopping-cart' do 
		expect(page).to have_content 0
	end
end