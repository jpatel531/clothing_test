angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$http.get('/shopping_cart/user_choices').success (data) ->
		$scope.shoppingCart = data
		$scope.shoppingCart.originalTotal = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price
		$scope.shoppingCart.total = $scope.shoppingCart.originalTotal

	$scope.selectedVouchers = []

	$scope.vouchers = [
		{name: "£5 off your order", discount: 5, requirements: {spend: 0, category: null}},
		{name: "£10 off when you spend over £50", discount: 10, requirements: {spend: 50, category: null}},
		{name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, requirements: {spend: 75, category: "Footwear"}}
	]

	isEnoughMoneyFor = (voucher) ->
		voucher.requirements.spend <= $scope.shoppingCart.total		

	isCorrectCategoryFor = (voucher) ->
		if voucher.requirements.category is null
			return true
		else 
			_.any $scope.shoppingCart, (item) -> item.category.indexOf(voucher.requirements.category) > -1

	vouchersValid = ->
		_.any $scope.selectedVouchers, (voucher) ->
			isEnoughMoneyFor(voucher) && isCorrectCategoryFor(voucher)


	applyVouchers = ->
		_.each $scope.vouchers, (voucher) -> 
			if _.contains(_.pluck($scope.selectedVouchers, "name"), voucher.name) then $scope.shoppingCart.total -= voucher.discount

	$scope.$watch 'selectedVouchers', 
		(-> 
			$scope.shoppingCart.total = $scope.shoppingCart.originalTotal
			if vouchersValid() then applyVouchers()
		), 
		true

