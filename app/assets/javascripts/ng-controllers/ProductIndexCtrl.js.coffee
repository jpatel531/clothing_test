angular.module('Clothing')

.controller 'ProductIndexCtrl', ($scope, $http) ->

	$http.get('/products').success (data) -> $scope.products = data

	$http.get('/shopping_cart/user_choices').success (data) -> $scope.shoppingCart = data
