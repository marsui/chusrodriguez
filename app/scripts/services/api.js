'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.api
 * @description
 * # api
 * Factory in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .factory('api', function () {
    // Service logic
    // ...

    var meaningOfLife = 42;

    // Public API here
    return {
      someMethod: function () {
        return meaningOfLife;
      }
    };
  });
