angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$http.get('/shopping_cart/user_choices').success (data) ->
		$scope.shoppingCart = data
		$scope.shoppingCart.total = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price

	$scope.selectedVouchers = []

	$scope.vouchers = [
		"£5 off your order",
		"£10 off when you spend over £50",
		"£15 off when you have bought at least one footwear item and spent over £75"
	]

	$scope.$watch 'selectedVouchers', 
		(-> 
			if _.contains($scope.selectedVouchers, "£5 off your order") then $scope.shoppingCart.total -= 5
			if _.contains($scope.selectedVouchers, "£10 off when you spend over £50") then $scope.shoppingCart.total -= 10
			if _.contains($scope.selectedVouchers, "£15 off when you have bought at least one footwear item and spent over £75") then $scope.shoppingCart.total -= 15
		), 
		true


