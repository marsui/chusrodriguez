'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:GalleryCtrl
 * @description
 * # GalleryCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('GalleryCtrl', function (Gallery){
    this.photos=Gallery.get();
  });
