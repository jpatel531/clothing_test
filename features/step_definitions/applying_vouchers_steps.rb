Given(/^I select "(.*?)" from the voucher dropdown$/) do |arg1|
	select arg1, from: "select_voucher"
end

Then(/^my total should be decreased by £(\d+)$/) do |arg1|
	within '.total' do 
		expect(page).to have_content "£94.00"
	end
end