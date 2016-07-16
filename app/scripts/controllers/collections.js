'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:CollectionListCtrl
 * @description
 * # CollectionListCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('CollectionListCtrl', function (Collections) {
    this.collections = Collections.search();
  });
