'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.accessories
 * @description
 * # accessories
 * Factory in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .factory('Accessories', ['$resource', 
    function($resource){
      return $resource('http://localhost:3000/accessories/:id', {}, {
        get: {
          method: 'GET',
          params: {
            id: '@id'
          }
        },
        search: {
          method: 'GET', 
          isArray: true,
          transformResponse: function (data) {
            var jsonData = angular.fromJson(data);
            if(jsonData.data) {
              return jsonData.data; 
            }

            return jsonData;
          }
        },
        save: {
          method: 'POST',
        },
        update: {
          method: 'PUT',
          params: {
            id: '@id'
          }
        },
        delete: {
          method: 'DELETE',
          params: {
            id: '@id'
          }
        }
      });
     }
  ]);
