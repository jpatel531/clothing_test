Then(/^I should not see "(.*?)" in my cart$/) do |arg1|
	sleep 5
	visit current_path
	expect(page).not_to have_content arg1
end