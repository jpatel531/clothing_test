class VouchersController < ApplicationController

	def index
		@vouchers = Voucher.all
		render "index.json.jbuilder"
	end

end
