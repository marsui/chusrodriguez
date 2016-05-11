'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.gallery
 * @description
 * # gallery
 * Factory in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .factory('Gallery', ['$resource', 
    function($resource){
      return $resource('resources/gallery.json', {}, {
        query: {method:'GET', isArray:true
      }});
     }
  ]);
