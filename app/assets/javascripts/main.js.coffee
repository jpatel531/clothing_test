App = angular.module('Clothing', ['ngRoute', 'templates'])

App.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

  $routeProvider
  .when('/shopping_cart', { templateUrl: 'shopping_cart/show.html', controller: 'CartCtrl'})
  # .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )

  $routeProvider.otherwise({ templateUrl: 'products/index.html', controller: 'ProductIndexCtrl' } )

  $locationProvider.html5Mode(true);

])

App.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])