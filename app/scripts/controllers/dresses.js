'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:DressListCtrl
 * @description
 * # DressListCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('DressListCtrl', function (Dresses) {

  	this.dressList = Dresses.search();

  });
