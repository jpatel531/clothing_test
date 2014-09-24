angular.module('Clothing').directive "addItem", ($http) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				if $scope.isInStock
					$scope.shoppingCart.length += 1
					$http.post '/shopping_cart', {product_id: attrs.id}
	}
