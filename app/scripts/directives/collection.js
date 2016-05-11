'use strict';

/**
 * @ngdoc directive
 * @name chusrodriguezApp.directive:collection
 * @description
 * # collection
 */
angular.module('chusrodriguezApp')
  .directive('collection', function () {
    return {
      templateUrl: 'views/collection/collection.html',
      restrict: 'E',
      scope: {
      	src: '='
      },
      link: function postLink(scope, element, attrs) {
      }
    };
  });
