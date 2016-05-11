'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:AuthCtrl
 * @description
 * # AuthCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
.controller('AuthCtrl', ['$scope', 'Facebook', function($scope, Facebook) {

	$scope.$watch(function() {
	  // This is for convenience, to notify if Facebook is loaded and ready to go.
	  return Facebook.isReady();
	}, function(newVal) {
	  // You might want to use this to disable/show/hide buttons and else
	  $scope.facebookReady = newVal;
	});
    $scope.login = function() {
      // From now on you can use the Facebook service just as Facebook api says
      Facebook.login(function(response) {
        // Do something with response.
      });
    };

    $scope.getLoginStatus = function() {
      Facebook.getLoginStatus(function(response) {
        if(response.status === 'connected') {
          $scope.loggedIn = true;
        } else {
          $scope.loggedIn = false;
        }
      });
    };

    $scope.me = function() {
      Facebook.api('/me', function(response) {
        $scope.user = response;
      });
    };
  }]);