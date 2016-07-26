'use strict';

/**
 * @ngdoc directive
 * @name chusrodriguezApp.directive:imageField
 * @description
 * # imageField
 */
angular.module('chusrodriguezApp')
  .directive('imageField', ['Admin', 'Upload', '$rootScope', function (Admin, Upload, $rootScope) {
    return {
      templateUrl: 'views/admin/image-field.html',
      restrict: 'E',
      replace: true,
      link: function postLink(scope, element, attrs) {
        if(!scope.value.text) {
          scope.value.text = '';
          scope.images = [];
        }
        else {
          scope.images = scope.value.text.split(',');
        }

        scope.ready = true;
        scope.uploading = false;
        scope.process = '';

        scope.upload = function (file) {
          if(!file.length) return;
          scope.ready = false;
          scope.uploading = true;

      		var url = '/admin/photos/upload';
      		Upload.upload({
	        	url: url,
	        	data: {
	        	  file: file
	        	}
	        }).then(function (resp) {
	            scope.uploading = false;
	            scope.ready = true;

	            scope.images.push(resp.data);
	            scope.value.text = scope.images.map(function(item) { return item.trim() } ).join(',');

	        }, function (resp) {
	            console.log('Error status: ' + resp.status);
	        }, function (evt) {
	            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
	            scope.process = 'Cargando: ' + progressPercentage + '%';
    		});

        scope.selectedPicture = null
    		scope.setSelectedPicture = function(picture) {
          scope.selectedPicture = picture;
    		};

    		scope.setDefaultPicture = function() {
          scope.entity.image_url = scope.selectedPicture;
        };

        scope.deleteSelectedPicture = function() {
          $rootScope.operations.confirm('Por favor confirma', '¿Realmente deseas borrar esta foto?', function(data) {

            scope.images.splice(scope.value.text.indexOf(scope.selectedPicture), 1);
            scope.value.text = scope.images.map(function(item) { return item.trim() } ).join(',');
            scope.selectedPicture = null;
            // TODO Delete from S3

          })
        };
    	};
      }
    };
  }]);
