class ProductsController < ApplicationController

	def index
		@products = Product.all
		render json: @products.to_json(except: [:created_at, :updated_at])
	end
	
end
