'use strict';

/**
 * @ngdoc function
 * @name webAppEmailPredictorApp.controller:DatasetCtrl
 * @description
 * # DatasetCtrl
 * Controller of the webAppEmailPredictorApp
 */
app.controller('DatasetCtrl', function ($scope,Dataset) {
    Dataset.all().then(function(data){
      $scope.datasets = data;
    });
  });
