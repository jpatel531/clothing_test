Given(/^there are products$/) do
	create :product1 
	create :product2 
	create :product3
end

Then(/^I should be able to see the appropriate list of products$/) do
	until page.evaluate_script 'jQuery.active == 0'
		expect(page).to have_content 'Almond Toe Court Shoes, Patent Black'
		expect(page).to have_content '£99.00'
		expect(page).to have_content 'Women\'s Footwear'
		expect(page).to have_content '5'
	end
end