angular.module('Clothing').factory 'Vouchers', ($http) ->

	Vouchers = {}

	Vouchers.get = ->
		$http.get('/vouchers').success (data) ->
			Vouchers.list = data

	Vouchers.isEnoughMoneyFor = (voucher, total) ->
		voucher.requirements.spend < total

	Vouchers.isCorrectCategoryFor = (voucher, cart) ->
		unless voucher.requirements.category?
			return true
		else 
			_.any cart, (item) -> item.category.indexOf(voucher.requirements.category) > -1

	Vouchers.areValid = (selection, shoppingCart) ->
		_.all selection, (voucher) ->
			Vouchers.isEnoughMoneyFor(voucher, shoppingCart.total) && Vouchers.isCorrectCategoryFor(voucher, shoppingCart)

	return Vouchers