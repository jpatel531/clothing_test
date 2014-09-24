angular.module('Clothing').directive "removeItem", ($http, ShoppingCart) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				$http.delete('/shopping_cart/user_choices/' + attrs.id)
				.then -> $scope.getShoppingCart()
	}


