describe "CartCtrl", ->

  beforeEach module('Clothing')
  CartCtrl = scope = null

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CartCtrl = $controller 'CartCtrl', {$scope: scope}


  describe "testing", ->
    it "should work", ->
    	expect(scope.selectedVouchers.length).toBe 0