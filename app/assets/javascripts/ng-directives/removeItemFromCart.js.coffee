angular.module('Clothing').directive "removeItem", ($http) ->

	return {
		link: ($scope, el, attrs) ->
			el.bind 'click', (e) ->
				$http.delete('/shopping_cart/user_choices/' + attrs.id).then $scope.getUserChoices()

	}


