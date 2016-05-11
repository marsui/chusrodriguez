'use strict';

/**
 * @ngdoc directive
 * @name chusrodriguezApp.directive:photo
 * @description
 * # photo
 */
angular.module('chusrodriguezApp')
  .directive('photo', function () {
    return {
      templateUrl: 'views/photo/photo.html',
      restrict: 'E',
      scope: {
      	src: '='
      },
      link: function postLink(scope, element, attrs) {
        
      }
    };
  });
