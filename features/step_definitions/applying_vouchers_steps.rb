Given(/^I select "(.*?)" from the voucher dropdown$/) do |arg1|
	check arg1
end

Then(/^my total should be decreased by £(\d+)$/) do |arg1|
	original_total = @product.price
	discount = arg1.to_i
	new_total = format("£%.2f", original_total - discount)
	within '.total' do 
		expect(page).to have_content new_total
	end
end

Then(/^the total should not change$/) do
	within '.total' do
		expect(page).to have_content "£30.00"
	end
end

Then(/^I should be alerted that I have selected an invalid voucher$/) do
	expect(page).to have_content "You have at least one invalid voucher"
end

