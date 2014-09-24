angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http) ->


	getVouchers = ->
		$http.get('/vouchers').success (data) ->
			$scope.vouchers = data

	$scope.shoppingCart = []

	$scope.getUserChoices = ->
		$http.get('/shopping_cart/user_choices').success (data) ->
			$scope.shoppingCart = data
			$scope.shoppingCart.originalTotal = _.inject (_.map $scope.shoppingCart, (item) -> item.price ), (sum, price) -> sum + price
			$scope.shoppingCart.total = $scope.shoppingCart.originalTotal

	getVouchers()
	$scope.getUserChoices()

	$scope.selectedVouchers = []

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

