'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:CollectionListCtrl
 * @description
 * # CollectionListCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('CollectionListCtrl', function () {
    this.collections = [
    	'http://png.clipart.me/graphics/thumbs/144/wedding-dress-vector_144294793.jpg',
    	'http://png.clipart.me/graphics/thumbs/144/wedding-dress-vector_144294811.jpg',
    	'http://photos.gograph.com/thumbs/CSP/CSP992/k14676042.jpg',
    	'http://images.clipartlogo.com/files/ss/original/368/36832159/dress-black-on-hander-vector.jpg'
    ];
  });
