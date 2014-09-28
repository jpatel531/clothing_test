class VouchersController < ApplicationController

	def index
		@vouchers = Voucher.all
		render json: @vouchers.to_json
	end

end
