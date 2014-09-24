angular.module('Clothing').directive "addItem", ($http) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				unless parseInt(attrs.quantity) is 0 
					$scope.$apply -> $scope.$parent.stockMessage = ""
					$scope.shoppingCart.length += 1
					$http.post '/shopping_cart', {product_id: attrs.id}
				else
					$scope.$apply -> $scope.$parent.stockMessage = "You cannot add a product that is out of stock to your cart"
	}
