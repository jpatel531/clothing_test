class ProductsController < ApplicationController

	def index
		@products = Product.all
		render json: @products.to_json(except: [:id, :created_at, :updated_at])
	end

end
