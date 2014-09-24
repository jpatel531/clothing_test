json.array! @vouchers do |voucher|
	json.name voucher.name
	json.discount voucher.discount
	json.requirements do
		json.spend voucher.spend_requirements
		json.category voucher.category_requirements
	end
end