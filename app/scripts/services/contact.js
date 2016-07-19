'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.contact
 * @description
 * # contact
 * Service in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .service('contact', function ($http) {
    // AngularJS will instantiate a singleton by calling "new" on this function
    this.send = function(user){
    	$http.post('/contacts', user);
    }
  });
