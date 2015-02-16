'use strict';

/**
 * @ngdoc overview
 * @name webAppEmailPredictorApp
 * @description
 * # webAppEmailPredictorApp
 *
 * Main module of the application.
 */
angular
  .module('webAppEmailPredictorApp', []);

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
