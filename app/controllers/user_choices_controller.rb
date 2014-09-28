class UserChoicesController < ApplicationController

	def index
		session[:number] ||= 0
		session[:cart] ||= []
		@products = session[:cart].map {|id| Product.find id}
		render json: @products.to_json
	end

	def create
		session[:cart] << params[:product_id]
		render json: {success: 200}
	end

	def destroy
		id = params[:id]
		session[:cart].delete id
		render json: {success: 200}
	end

end
