class ShoppingCartController < ApplicationController

	def user_choices
		session[:number] ||= 0
		session[:cart] ||= []
		render json: session[:cart].to_json
	end

	def add_to_cart
		session[:number] += 1
		@product = Product.find params[:product_id]
		session[:cart] << @product
		render json: {success: 200}
	end

	def delete_choice
		@product = Product.find params[:product_id]
		session[:cart].delete_at session[:cart].index(@product)
		render json: {success: 200}
	end

end
