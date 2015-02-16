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

app.config(function($stateProvider, $urlRouterProvider) {
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

});
