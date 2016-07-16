'use strict';

/**
 * @ngdoc filter
 * @name chusrodriguezApp.filter:itemName
 * @function
 * @description
 * # itemName
 * Filter in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .filter('itemName', function () {
    return function (input) {
    	var items = ['dress', 'accessory'];
    	var translations = ['vestido', 'complemento'];

    	var index = items.indexOf(input);
    	return translations[index];
    };
  });
