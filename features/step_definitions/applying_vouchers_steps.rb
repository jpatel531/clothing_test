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

# Then(/^I should not be able to click the £(\d+) off when over £(\d+) discount$/) do |arg1, arg2|
# 	expect(page).not_to have_content '£10 off when you spend over £50'
# end

