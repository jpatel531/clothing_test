angular.module('Clothing').directive "addItem", ($http, $timeout) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				unless parseInt(attrs.quantity) is 0 
					$scope.$apply -> $scope.$parent.stockMessage = ""
					$scope.shoppingCart.length += 1
					$http.post 'api/shopping_cart/user_choices', {product_id: attrs.id}
				else
					$scope.$apply -> 
						$scope.$parent.stockMessage = "You cannot add a product that is out of stock to your cart"
						$timeout((-> $scope.$parent.stockMessage = null), 5000)
	}
