'use strict';

/**
 * @ngdoc service
 * @name chusrodriguezApp.gallery
 * @description
 * # gallery
 * Factory in the chusrodriguezApp.
 */
angular.module('chusrodriguezApp')
  .factory('Collections', ['$resource',
    function($resource){
      return $resource('/collections/:id', {}, {
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
