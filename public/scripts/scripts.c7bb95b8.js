"use strict";var app=angular.module("webAppEmailPredictorApp",["restangular","ui.router"]);app.config(["$stateProvider","$urlRouterProvider",function(a,b){b.otherwise("/users"),a.state("users",{url:"/users",templateUrl:"views/users.html",controller:"UserCtrl"})}]),angular.module("webAppEmailPredictorApp").controller("MainCtrl",["$scope",function(a){a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}]),app.controller("UserCtrl",["$scope","Restangular",function(a,b){console.log("here");var c=b.all("api/users");c.getList().then(function(b){console.log(b),a.users=b})}]);