Given(/^there are vouchers$/) do
	create :voucher1
	create :voucher2
	create :voucher3
end

Given(/^I select "(.*?)" from the voucher dropdown$/) do |arg1|
	until page.evaluate_script 'jQuery.active == 0'
		check arg1
	end
end

Then(/^my total should be decreased by £(\d+)$/) do |arg1|
	original_total = @product.price
	discount = arg1.to_i
	new_total = format("£%.2f", original_total - discount)
	until page.evaluate_script 'jQuery.active == 0'
		within '.total' do 
			expect(page).to have_content new_total
		end
	end
end

Then(/^the total should not change$/) do
	until page.evaluate_script 'jQuery.active == 0'
		within '.total' do
			expect(page).to have_content "£30.00"
		end
	end
end

Then(/^I should be alerted that I have selected an invalid voucher$/) do
	until page.evaluate_script 'jQuery.active == 0'
		expect(page).to have_content "You have at least one invalid voucher"
	end
end

