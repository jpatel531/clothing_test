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

	it "should get a customer's wishlist and assign it to scope", ->
		data = [{"id": 8,
		"created_at": "2014-09-21T18:25:54.965Z",
		"updated_at": "2014-09-21T18:25:54.965Z",
		"name": "Cotton Shorts, Medium Red",
		"category": "Women's Casualwear",
		"price": 30,
		"quantity": 5}]

		httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
		httpBackend.flush()
		expect(scope.shoppingCart[0].name).toEqual "Cotton Shorts, Medium Red"

	it "should calculate the correct original total of products", ->
		data = [{"name": "Cotton Shorts, Medium Red", price: 30}, {"name": "Leather Tights", "price": 50}]
		httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
		httpBackend.flush()
		expect(scope.shoppingCart.originalTotal).toEqual 80

	describe 'voucher validations', ->

		it 'will not allow you to apply the same voucher twice', ->
			data = [{"name": "Cotton Shorts, Medium Red", price: 30}, {"name": "Leather Tights", "price": 50}]
			httpBackend.expect('GET', '/shopping_cart/user_choices').respond data
			httpBackend.flush()
			scope.$apply -> scope.selectedVouchers = [{name: "£5 off your order", discount: 5, requirements: {spend: 0, category: null}}]
			scope.$apply -> scope.selectedVouchers = []
			scope.$apply -> scope.selectedVouchers = [{name: "£5 off your order", discount: 5, requirements: {spend: 0, category: null}}]
			expect(scope.shoppingCart.total).toEqual 75

		













