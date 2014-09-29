angular.module('Clothing').directive "removeItem", ['$http', 'ShoppingCart', ($http, ShoppingCart) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				$http.delete('api/shopping_cart/user_choices/' + attrs.id)
				.then -> $scope.getShoppingCart()
	}
]