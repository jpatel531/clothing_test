angular.module('Clothing')

.controller 'ProductIndexCtrl', ($scope, $http) ->

	$http.get('/products').success (data) ->
		$scope.products = data

	$http.get('/shopping_cart/user_choices').success (data) ->
		console.log data.number
		$scope.shoppingCart = data

	$scope.addToCart = (id) ->
		$scope.shoppingCart.length += 1
		$http.post '/shopping_cart', {product_id: id}
