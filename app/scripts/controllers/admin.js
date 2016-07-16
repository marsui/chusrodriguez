'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:AdminCtrl
 * @description
 * # AdminCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('AdminCtrl', function ($rootScope) {
  	this.items = $rootScope.metadata.entities;
  	this.operations = $rootScope.operations;
  });
