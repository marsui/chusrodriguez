'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.dresses
 * @description
 * # dresses
 * Factory in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .factory('Dresses', ['$resource',
    function($resource){
      return $resource('/dresses/:id', {}, {
        get: {
          method: 'GET',
          params: {
            id: '@id'
          },
          transformResponse: function (data) {
            var jsonData = angular.fromJson(data);

            if(jsonData) {
              jsonData.photos = jsonData.photos.split(',');
            }

            return jsonData;
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

