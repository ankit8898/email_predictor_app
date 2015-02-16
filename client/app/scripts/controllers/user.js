'use strict';

/**
 * @ngdoc function
 * @name webAppEmailPredictorApp.controller:UserCtrl
 * @description
 * # UserCtrl
 * Controller of the webAppEmailPredictorApp
 */
app.controller('UserCtrl', function ($scope,Restangular) {

  console.log('here')

    var baseAccounts = Restangular.all('api/users');

    baseAccounts.getList().then(function(users) {
      console.log(users)
  $scope.users = users;
});
  });
