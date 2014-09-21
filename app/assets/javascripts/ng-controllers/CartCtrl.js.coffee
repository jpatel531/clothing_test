angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$http.get('/shopping_cart/user_choices').success (data) ->
		$scope.shoppingCart = data
