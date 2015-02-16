'use strict';

app.controller('PredictionCtrl', function ($scope,Prediction,Dataset) {

    Prediction.all().then(function(data){
      $scope.predictions = data;
    });

     Dataset.all().then(function(data){
      $scope.datasets = data;
    });
    $scope.predict = function(){
      Prediction.create().then(function(data){
        console.log(data)
      })
    }
  });
