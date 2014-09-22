angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$http.get('/shopping_cart/user_choices').success (data) ->
		$scope.shoppingCart = data
		$scope.shoppingCart.total = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price

	$scope.selectedVouchers = []

	$scope.vouchers = [
		{name: "£5 off your order", discount: 5},
		{name: "£10 off when you spend over £50", discount: 10},
		{name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15}
	]

	$scope.$watch 'selectedVouchers', 
		(-> 
			_.each $scope.vouchers, (voucher) -> 
				if _.contains($scope.selectedVouchers, voucher.name) then $scope.shoppingCart.total -= voucher.discount
		), 
		true

