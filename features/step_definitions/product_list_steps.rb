Given(/^there are products$/) do
	load "#{Rails.root}/db/seeds.rb"
end

Then(/^I should be able to see the appropriate list of products$/) do
	expect(page).to have_content 'Almond Toe Court Shoes, Patent Black'
	expect(page).to have_content '£99.00'
	expect(page).to have_content 'Women\'s Footwear'
	expect(page).to have_content '5'
end