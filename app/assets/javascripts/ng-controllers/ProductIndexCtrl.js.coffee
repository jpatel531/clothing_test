angular.module('Clothing').controller 'ProductIndexCtrl', ($scope, $http, ShoppingCart) ->

	$http.get('/api/products').success (data) -> $scope.products = data

	ShoppingCart.getItems().then -> $scope.shoppingCart = ShoppingCart.items