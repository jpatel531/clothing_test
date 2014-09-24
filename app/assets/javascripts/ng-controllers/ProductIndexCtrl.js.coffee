angular.module('Clothing')

.controller 'ProductIndexCtrl', ($scope, $http) ->

	$http.get('/products').success (data) -> $scope.products = data

	$http.get('/shopping_cart/user_choices').success (data) -> $scope.shoppingCart = data

	$scope.isInStock = (quantity) ->
		if quantity is 0
			$scope.stockMessage = "You cannot add a product that is out of stock to your cart"
			false
		else
			$scope.stockMessage = ""
			true

	$scope.addToCart = (id) ->
		$scope.shoppingCart.length += 1
		$http.post '/shopping_cart', {product_id: id}
