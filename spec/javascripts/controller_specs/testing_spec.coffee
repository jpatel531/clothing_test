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