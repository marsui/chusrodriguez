'use strict';

/**
 * @ngdoc directive
 * @name chusrodriguezApp.directive:scrollWatcher
 * @description
 * # scrollWatcher
 */
angular.module('chusrodriguezApp')
  .directive('scrollWatcher', function () {
    return {
      restrict: 'A',
      link: function postLink(scope, element) {
      	angular.element(element).bind('scroll', function() {

      		var height = element[0].scrollHeight - element[0].offsetHeight;
      		var scroll = element[0].scrollTop;

      		var msg = {
      			absolute: scroll,
      			height: height,
      			relative: (scroll / height)
      		};

      		// scope.$emit(scope.id + '-scroll-watcher', msg);
      	});

      	scope.$on('set-scroll', function(event, data) {
      		if(data.relative) {
      			var height = element[0].scrollHeight - element[0].offsetHeight;

      			var newScroll = height * data.relative;

      			element[0].scrollTop = newScroll;
      		}
      	});
      }
    };
  });
