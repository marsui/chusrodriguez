'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the chusrodriguezApp
 */
 angular.module('chusrodriguezApp')
 .controller('MainCtrl', ['$scope','$rootScope','$location', 'common', function ($scope, $rootScope, $location, common) {
 	var navigation = common.read('navigation-history');
 	if(!navigation) {
 		navigation = [];
 		common.store('navigation-history', navigation);
 	}

 	$rootScope.back = function () {
 		var currentRoute = navigation.pop();
 		var lastRoute = navigation.pop();
 		$location.path(lastRoute);
 	};

 	$scope.calculateRoute = function() {
 		$scope.route = $location.path();
 		var last = navigation[navigation.length - 1];
 		if(last !== $scope.route) {
 			navigation.push($scope.route);
 		}
 	};

 	$scope.$on('$routeChangeSuccess', function(evt, data) {
 		$scope.calculateRoute();
 	});

 	$scope.calculateRoute();
 }]);
