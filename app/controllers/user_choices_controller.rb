class UserChoicesController < ApplicationController

	def index
		session[:number] ||= 0
		session[:cart] ||= []
		render json: session[:cart].to_json
	end

	def create
		session[:number] += 1
		@product = Product.find params[:product_id]
		session[:cart] << @product
		render json: {success: 200}
	end

	def destroy
		@product = Product.find params[:id]
		session[:cart].delete_at session[:cart].index(@product)
		render json: {success: 200}
	end

end
