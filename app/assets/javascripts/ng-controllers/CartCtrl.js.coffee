angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$http.get('/shopping_cart/user_choices').success (data) ->
		$scope.shoppingCart = data
		$scope.shoppingCart.total = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price

	$scope.$watch 'voucher', ->
		if $scope.voucher is "1" then $scope.shoppingCart.total -= 5
		if $scope.voucher is "2" then $scope.shoppingCart.total -= 10