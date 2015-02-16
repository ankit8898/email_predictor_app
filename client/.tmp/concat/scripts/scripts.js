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
    .state('predictions', {
      url: "/",
      templateUrl: "views/predictions.html",
      controller: 'PredictionCtrl'
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

app.controller('PredictionCtrl', ["$scope", "Prediction", "Dataset", function ($scope,Prediction,Dataset) {

    $scope.prediction = {}
    $scope.success = false
    $scope.success = false

    Prediction.all().then(function(data){
      $scope.predictions = data;
    });

     Dataset.all().then(function(data){
      $scope.datasets = data;
    });

    $scope.predict = function(prediction){
      Prediction.create(prediction).then(function(result){
        $scope.predicted = result.data.prediction
        $scope.predictions.push($scope.predicted)
        console.log(data)
        $scope.prediction = {}
        if (result.message === 'success') {
          $scope.success = true
        }
        else {
          $scope.error_message = result.message
          $scope.error =  true
        }

      })
    }
  }]);

'use strict';

/**
 * @ngdoc service
 * @name webAppEmailPredictorApp.prediction
 * @description
 * # prediction
 * Service in the webAppEmailPredictorApp.
 */
app.service('Prediction', ["Restangular", function Prediction(Restangular) {
    // AngularJS will instantiate a singleton by calling "new" on this function

    var baseUrl = Restangular.all('api/predictions');


    this.all = function(){
      return baseUrl.getList()
    }

  this.create = function(prediction) {
    return baseUrl.post(prediction);
  };

  }]);

'use strict';

/**
 * @ngdoc service
 * @name webAppEmailPredictorApp.dataset
 * @description
 * # dataset
 * Service in the webAppEmailPredictorApp.
 */
app.service('Dataset', ["Restangular", function Dataset(Restangular) {
    // AngularJS will instantiate a singleton by calling "new" on this function
     var baseUrl = Restangular.all('api/datasets');


    this.all = function(){
      return baseUrl.getList()
    }

  }]);

'use strict';

/**
 * @ngdoc function
 * @name webAppEmailPredictorApp.controller:DatasetCtrl
 * @description
 * # DatasetCtrl
 * Controller of the webAppEmailPredictorApp
 */
app.controller('DatasetCtrl', ["$scope", "Dataset", function ($scope,Dataset) {
    Dataset.all().then(function(data){
      $scope.datasets = data;
    });
  }]);
