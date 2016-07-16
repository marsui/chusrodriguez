'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:CollectionDetailCtrl
 * @description
 * # CollectionDetailCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('CollectionDetailCtrl', function (Collections, Dresses, $routeParams) {
  	var collectionId = $routeParams.id;
  	var query = {
  		collection_id: collectionId
  	};

  	this.dressList = Dresses.search(query);

  });
