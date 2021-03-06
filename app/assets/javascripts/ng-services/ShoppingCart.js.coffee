angular.module('Clothing').factory 'ShoppingCart', ['$http', ($http) ->

	ShoppingCart = {}

	ShoppingCart.getItems = ->
		$http.get('api/shopping_cart/user_choices').success (data) -> 
			ShoppingCart.items = data
			if ShoppingCart.items.length > 0 then ShoppingCart.originalTotal = _.inject (_.map data, (item) -> item.price ), (sum, price) -> sum + price

	return ShoppingCart

]