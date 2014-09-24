angular.module('Clothing')

.controller 'CartCtrl', ($scope, $http, ShoppingCart, Vouchers) ->


	getVouchers = ->
		Vouchers.get().then -> $scope.vouchers = Vouchers.list

	$scope.getShoppingCart = ->
		ShoppingCart.getItems().then -> 
			$scope.shoppingCart = ShoppingCart.items
			$scope.shoppingCart.originalTotal = $scope.shoppingCart.total = ShoppingCart.originalTotal

	$scope.getShoppingCart()
	getVouchers()

	$scope.selectedVouchers = []

	applyVouchers = ->
		_.each $scope.vouchers, (voucher) -> 
			if _.contains(_.pluck($scope.selectedVouchers, "name"), voucher.name) then $scope.shoppingCart.total -= voucher.discount

	$scope.$watch 'selectedVouchers', 
		(-> 
			$scope.shoppingCart.total = $scope.shoppingCart.originalTotal if $scope.shoppingCart?
			$scope.validationMessage = ""
			return if $scope.selectedVouchers.length is 0
			if Vouchers.areValid($scope.selectedVouchers, $scope.shoppingCart) then applyVouchers() else ($scope.validationMessage = "You have at least one invalid voucher")
		), 
		true

