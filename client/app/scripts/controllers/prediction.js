'use strict';

app.controller('PredictionCtrl', function ($scope,Prediction,Dataset) {

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
  });
