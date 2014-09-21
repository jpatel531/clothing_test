angular.module('Clothing')

.controller 'ProductIndexCtrl', ($scope, $http) ->

	$http.get('/products').success (data) ->
		$scope.products = data
