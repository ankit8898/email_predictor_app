'use strict';

/**
 * @ngdoc service
 * @name webAppEmailPredictorApp.dataset
 * @description
 * # dataset
 * Service in the webAppEmailPredictorApp.
 */
app.service('Dataset', function Dataset(Restangular) {
    // AngularJS will instantiate a singleton by calling "new" on this function
     var baseUrl = Restangular.all('api/datasets');


    this.all = function(){
      return baseUrl.getList()
    }

  });
