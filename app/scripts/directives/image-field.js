'use strict';

/**
 * @ngdoc directive
 * @name chusrodriguezApp.directive:imageField
 * @description
 * # imageField
 */
angular.module('chusrodriguezApp')
  .directive('imageField', function (Admin, Upload) {
    return {
      templateUrl: 'views/admin/image-field.html',
      restrict: 'E',
      replace: true,
      link: function postLink(scope, element, attrs) {
        scope.ready = true;
        scope.uploading = false;
        scope.process = '';

        scope.upload = function (file) {
          scope.ready = false;
          scope.uploading = true;

      		var url = '/admin/photos/upload';
      		Upload.upload({
	        	url: url,
	        	data: {
	        	  file: file
	        	}
	        }).then(function (resp) {
	            scope.value.text = resp.data;
	            scope.uploading = false;
	            scope.ready = true;
	        }, function (resp) {
	            console.log('Error status: ' + resp.status);
	        }, function (evt) {
	            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
	            scope.process = 'Cargando: ' + progressPercentage + '%';
    		});
    	};
      }
    };
  });
