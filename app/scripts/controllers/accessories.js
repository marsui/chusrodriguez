'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:AccessoriesCtrl
 * @description
 * # AccessoriesCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('AccessoriesCtrl', function (Accessories) {
    this.accesoryList = Accessories.search();
  });
