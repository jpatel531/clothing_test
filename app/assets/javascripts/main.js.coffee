App = angular.module('Clothing', ['ngRoute', 'templates'])

App.config(['$routeProvider', ($routeProvider) ->

  # $routeProvider
  # .when('/', { templateUrl: '../views/products/index.html'}, controller: 'IndexCtrl')
  # .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )

  $routeProvider.otherwise({ templateUrl: 'products/index.html', controller: 'IndexCtrl' } )

])

App.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])