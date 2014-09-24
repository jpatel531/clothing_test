angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->

	$scope.shoppingCart = []

	getUserChoices = ->
		$http.get('/shopping_cart/user_choices').success (data) ->
			$scope.shoppingCart = data
			$scope.shoppingCart.originalTotal = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price
			$scope.shoppingCart.total = $scope.shoppingCart.originalTotal

	getUserChoices()

	$scope.selectedVouchers = []

	$scope.removeItem = (id) ->
		$http.delete('/shopping_cart/user_choices/' + id).then getUserChoices()

	$scope.vouchers = [
		{name: "£5 off your order", discount: 5, requirements: {spend: 0, category: null}},
		{name: "£10 off when you spend over £50", discount: 10, requirements: {spend: 50, category: null}},
		{name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, requirements: {spend: 75, category: "Footwear"}}
	]

	isEnoughMoneyFor = (voucher) ->
		voucher.requirements.spend < $scope.shoppingCart.total		

	isCorrectCategoryFor = (voucher) ->
		unless voucher.requirements.category?
			return true
		else 
			_.any $scope.shoppingCart, (item) -> item.category.indexOf(voucher.requirements.category) > -1

	vouchersValid = ->
		_.all $scope.selectedVouchers, (voucher) ->
			isEnoughMoneyFor(voucher) && isCorrectCategoryFor(voucher)


	applyVouchers = ->
		$scope.validationMessage = ""
		_.each $scope.vouchers, (voucher) -> 
			if _.contains(_.pluck($scope.selectedVouchers, "name"), voucher.name) then $scope.shoppingCart.total -= voucher.discount

	$scope.$watch 'selectedVouchers', 
		(-> 
			$scope.shoppingCart.total = $scope.shoppingCart.originalTotal
			$scope.validationMessage = ""
			return if $scope.selectedVouchers.length is 0
			if vouchersValid() then applyVouchers() else ($scope.validationMessage = "You have at least one invalid voucher")
		), 
		true

