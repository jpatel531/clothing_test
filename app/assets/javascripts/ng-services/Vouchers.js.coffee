angular.module('Clothing').factory 'Vouchers', ($http) ->

	Vouchers = {}

	Vouchers.get = ->
		$http.get('/vouchers').success (data) ->
			Vouchers.list = data

	Vouchers.isEnoughMoneyFor = (voucher, total) ->
		voucher.spend_requirements < total

	Vouchers.isCorrectCategoryFor = (voucher, cart) ->
		unless voucher.category_requirements?
			return true
		else 
			_.any cart, (item) -> item.category.indexOf(voucher.category_requirements) > -1

	Vouchers.areValid = (selection, shoppingCart) ->
		_.all selection, (voucher) ->
			Vouchers.isEnoughMoneyFor(voucher, shoppingCart.total) && Vouchers.isCorrectCategoryFor(voucher, shoppingCart)

	return Vouchers