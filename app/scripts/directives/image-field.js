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

        scope.upload = function (file) {

      		var url = 'http://localhost:3000/admin/photos/upload';
      		Upload.upload({
	        	url: url,
	        	data: {file: file}
	        }).then(function (resp) {
	            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);
	        }, function (resp) {
	            console.log('Error status: ' + resp.status);
	        }, function (evt) {
	            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
	            console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
    		});
    	};
      }
    };
  });
