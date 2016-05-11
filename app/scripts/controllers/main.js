'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the chusrodriguezApp
 */
 angular.module('chusrodriguezApp')
 .controller('MainCtrl', function ($scope, $uibModal) {
 	$scope.open = function (size) {

 		var modalInstance = $uibModal.open({
 			templateUrl: 'views/modal.html',
 			controller: 'ModalCtrl',
 			size: size,
 			resolve: {
 				items: function () {
 					return $scope.items;
 				}
 			}
 		});

 		modalInstance.result.then(function (selectedItem) {
 			$scope.selected = selectedItem;
 		}, function () {
 			$log.info('Modal dismissed at: ' + new Date());
 		});
 	};
 });
