'use strict';

/**
 * @ngdoc overview
 * @name webAppEmailPredictorApp
 * @description
 * # webAppEmailPredictorApp
 *
 * Main module of the application.
 */
var app = angular.module('webAppEmailPredictorApp', ['restangular','ui.router']);

app.config(["$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/");
  //
  // Now set up the states
  $stateProvider
    .state('users', {
      url: "/",
      templateUrl: "views/users.html",
      controller: 'UserCtrl'
    })

}]);

'use strict';

/**
 * @ngdoc function
 * @name webAppEmailPredictorApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppEmailPredictorApp
 */
angular.module('webAppEmailPredictorApp')
  .controller('MainCtrl', ["$scope", function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  }]);

'use strict';

/**
 * @ngdoc function
 * @name webAppEmailPredictorApp.controller:UserCtrl
 * @description
 * # UserCtrl
 * Controller of the webAppEmailPredictorApp
 */
app.controller('UserCtrl', ["$scope", "Restangular", function ($scope,Restangular) {

  console.log('here')

    var baseAccounts = Restangular.all('api/users');

    baseAccounts.getList().then(function(users) {
      console.log(users)
  $scope.users = users;
});
  }]);
