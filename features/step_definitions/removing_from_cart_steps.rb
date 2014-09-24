Given(/^I click to remove "(.*?)"$/) do |arg1|
	click_link 'Remove From Cart'
end


Then(/^I should no longer see "(.*?)" in my cart$/) do |arg1|
	sleep 5
	visit current_path
	# save_and_open_page
	expect(page).not_to have_content arg1
	expect(page).to have_content "You have no items in your cart"
end