describe "CartCtrl", ->

	beforeEach module('Clothing')
	CartCtrl = scope = httpBackend = null

	beforeEach inject ($controller, $rootScope, $httpBackend) ->
		httpBackend = $httpBackend
		scope = $rootScope.$new()
		CartCtrl = $controller 'CartCtrl', {$scope: scope}

	afterEach ->
		httpBackend.verifyNoOutstandingExpectation()
		httpBackend.verifyNoOutstandingRequest()

	beforeEach ->
		vouchers = [{"name": "£5 off your order", "discount": 5,"requirements": {"spend": 0, "category": null}},{"name": "£10 off when you spend over £50","discount": 10,"requirements": {"spend": 50,"category": null}},{"name": "£15 off when you have bought at least one footwear item and spent over £75","discount": 15,"requirements": {"spend": 75,"category": "Footwear"}}]
		httpBackend.when('GET', '/vouchers').respond vouchers

	it "should get a customer's wishlist and assign it to scope", ->
		data = ["name": "Cotton Shorts, Medium Red"]
		httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
		httpBackend.flush()
		expect(scope.shoppingCart[0].name).toEqual "Cotton Shorts, Medium Red"

	it "should calculate the correct original total of products", ->
		data = [{"name": "Cotton Shorts, Medium Red", price: 30}, {"name": "Leather Tights", "price": 50}]
		httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
		httpBackend.flush()
		expect(scope.shoppingCart.originalTotal).toEqual 80

	describe 'voucher validations', ->

		describe 'price and category validations', ->

			it 'alerts you if the price requirement is not over the required amount', ->
				data = [{"name": "Pants", price: 50, category: "Women's Casualwear"}]
				httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
				httpBackend.flush()
				scope.$apply -> scope.selectedVouchers = [{name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: null}]
				expect(scope.validationMessage).toEqual "You have at least one invalid voucher"
				expect(scope.shoppingCart.total).toEqual 50

			it 'alerts you if the category requirement is not met', ->
				data = [{"name": "Pants", price: 80, category: "Women's Casualwear"}]
				httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
				httpBackend.flush()
				scope.$apply -> scope.selectedVouchers = [{name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: 'Footwear'}]
				expect(scope.validationMessage).toEqual "You have at least one invalid voucher"
				expect(scope.shoppingCart.total).toEqual 80

		describe 'alert messages', ->
			beforeEach ->
				data = [{"name": "Cotton Shorts, Medium Red", price: 30, category: "Women's Casualwear"}, {"name": "Leather Tights", "price": 50, "category": "Women's Formalwear"}]
				httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
				httpBackend.flush()

			it 'alerts you if at least one voucher is invalid', ->
				scope.$apply -> scope.selectedVouchers = [{name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: null}, {name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: "Footwear"}]
				expect(scope.validationMessage).toEqual "You have at least one invalid voucher"

			it 'no longer shows the alert if you unselect the inappropriate voucher', ->
				scope.$apply -> scope.selectedVouchers = [{name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: null}, {name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: "Footwear"}]
				expect(scope.validationMessage).toEqual "You have at least one invalid voucher"
				scope.$apply -> scope.selectedVouchers = [{name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: null}]
				expect(scope.validationMessage).toEqual ""

			it 'will not allow you to apply the same voucher twice', ->
				scope.$apply -> scope.selectedVouchers = [{name: "£5 off your order", discount: 5, spend_requirements: 0, category_requirements: null}]
				scope.$apply -> scope.selectedVouchers = []
				scope.$apply -> scope.selectedVouchers = [{name: "£5 off your order", discount: 5, spend_requirements: 0, category_requirements: null}]
				expect(scope.shoppingCart.total).toEqual 75