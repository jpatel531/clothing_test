angular.module('Clothing').factory 'ShoppingCart', ($http) ->

	ShoppingCart = {}

	ShoppingCart.getItems = ->
		$http.get('/shopping_cart/user_choices').success (data) -> 
			ShoppingCart.items = data
			ShoppingCart.originalTotal = _.inject (_.map data, (item) -> item.price ), (sum, price) -> sum + price

	return ShoppingCart