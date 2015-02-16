'use strict';

/**
 * @ngdoc service
 * @name webAppEmailPredictorApp.prediction
 * @description
 * # prediction
 * Service in the webAppEmailPredictorApp.
 */
app.service('Prediction', function Prediction(Restangular) {
    // AngularJS will instantiate a singleton by calling "new" on this function

    var baseUrl = Restangular.all('api/predictions');


    this.all = function(){
      return baseUrl.getList()
    }

  this.create = function(prediction) {
    var name = prediction.first_name + ' ' +  prediction.last_name
    return baseUrl.post({name:  name,  company: prediction.company});
  };

  });
