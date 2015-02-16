'use strict';

app.controller('PredictionCtrl', function ($scope,Prediction) {

    Prediction.all().then(function(data){
      $scope.predictions = data;
    });

    $scope.predict = function(){
      Prediction.create().then(function(data){
        console.log(data)
      })
    }
  });
