Then(/^I should not see "(.*?)" in my cart$/) do |arg1|
	expect(page).not_to have_content arg1
end

Then(/^I should only see one less copy of "(.*?)"$/) do |arg1|
	until page.evaluate_script 'jQuery.active == 0'
		number_of_items = page.all("p", text: arg1).count
		expect(number_of_items).to eq 1
	end
end